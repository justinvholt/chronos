class ImportSOFJob < ApplicationJob
  queue_as :default

  def perform(file, fixture)
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      @port = row[:port]
      @terminal = row[:terminal]
      @berth = row[:berth]
      @obl = row[:obl]
      @fixture = fixture
      generate_cargo_handlings

      arguments = {
        vessel_name: row[:vessel],
        voyage_number: row[:voy],
        port: @port,
        terminal: @terminal,
        berth: @berth,
        title: row[:title],
        datetime: DateTime.parse("#{row[:date]} #{row[:time]}:00, 0"),
        counting: "",
        laytime: 0.to_f,
        cargo_handlings: @cargo_handlings
        }
      Event.create!(arguments)
    end
  end

# NB: when there are two of the same port/terminal/berth calls/names in the same
# voyage this can cause trouble. Loading and disch ops then need to be separated

  def generate_cargo_handlings
    @cargos = []
    @cargo_handlings = []

    cargo_ops
    @cargos.each { |cargo| @cargo_handlings << CargoHandling.new(fixture_cargo: cargo) }
  end

  def cargo_ops
    if @obl != nil
      FixtureCargo.where(fixture: @fixture).each { |cargo| @cargos << cargo if cargo.obl == @obl }
    else
      shared_beth_ops
    end
  end

  def shared_beth_ops
    if @berth != nil
      FixtureCargo.where(fixture: @fixture).each do |cargo|
        @cargos << cargo if cargo.load_berth == @berth
        @cargos << cargo if cargo.disch_berth == @berth
      end
    else
      shared_terminal_ops
    end
  end

  def shared_terminal_ops
    if @terminal != nil
      FixtureCargo.where(fixture: @fixture).each do |cargo|
        @cargos << cargo if cargo.load_terminal == @terminal
        @cargos << cargo if cargo.disch_terminal == @terminal
      end
    else
      FixtureCargo.where(fixture: @fixture).each do |cargo|
        @cargos << cargo if cargo.load_port == @port
        @cargos << cargo if cargo.disch_port == @port
      end
    end
  end
end
