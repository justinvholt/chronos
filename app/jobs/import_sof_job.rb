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
        cargo_handlings: [cargos_handled]
        }
      Event.create!(arguments)
    end
  end

  def cargos_handled
    ## change this method to assign correct cargo handlings

    CargoHandling.new(fixture_cargo: FixtureCargo.first)
    # if @obl.nil? == false
    #   CargoHandling.new()
    #   #
    #   @fixture.fixture_cargos.where(obl: @obl)
    # elsif @berth.nil? == false
    #   @fixture.fixture_cargos.where(berth: @berth)
    # elsif @terminal.nil? == false
    #   @fixture.fixture_cargos.where(terminal: @terminal)
    # else
    #   @fixture.fixture_cargos.where(port: @port)
    # end
  end
end
