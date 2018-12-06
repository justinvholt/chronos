class ImportSOFJob < ApplicationJob
  queue_as :default
  #TODO: change rows to header
  def perform(file, fixture)
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      @port = row[2]
      @terminal = row[3]
      @berth = row[4]
      @obl = row[8]
      @fixture = fixture
      generate_cargo_handlings

      arguments = {
        vessel_name: row[0],
        voyage_number: row[1],
        port: @port,
        terminal: @terminal,
        berth: @berth,
        title: row[5],
        datetime: Time.parse("#{row[6]}, #{row[7]}:00, 0"),
        counting: "",
        laytime: Hash.new,
        cargo_handlings: @cargo_handlings
        }
      Event.create!(arguments)
    end
  end

# NB: when there are two of the same port/terminal/berth calls/names in the same
# voyage this can cause trouble. Loading and disch ops then need to be separated

  def generate_cargo_handlings
    @cargos = []
    cargo_ops
    @cargo_handlings = []
    @cargos.reject! { |cargo| cargo.empty? }
    @cargos.flatten!
    @cargos.each { |cargo| @cargo_handlings << CargoHandling.new(fixture_cargo: cargo) }
  end

  def cargo_ops
    unless @obl == nil
      @cargos << @fixture.fixture_cargos.where(obl: @obl)
    else
      shared_beth_ops
    end
  end

  def shared_beth_ops
    unless @berth == nil
      @cargos << @fixture.fixture_cargos.where(load_berth: @berth)
      @cargos << @fixture.fixture_cargos.where(disch_berth: @berth)
    else
      shared_terminal_ops
    end
  end

  def shared_terminal_ops
    unless @terminal == nil
      @cargos << @fixture.fixture_cargos.where(load_terminal: @terminal)
      @cargos << @fixture.fixture_cargos.where(disch_terminal: @terminal)
    else
      @cargos << @fixture.fixture_cargos.where(load_port: @port)
      @cargos << @fixture.fixture_cargos.where(disch_port: @port)
    end
  end
end
