class Event < ApplicationRecord

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      @port = row[2]
      @terminal = row[3]
      @berth = row[4]
      @obl = row[8]
      append_cargoes

      arguments = {
        vessel_name: row[0],
        voyage_number: row[1],
        port: @port,
        terminal: @terminal,
        berth: @berth,
        title: row[5],
        datetime: Time.parse("#{row[6]}, #{row[7]}:00, 0"),
        fixture_cargo: @append_cargoes,
        counting: "",
        laytime: Hash.new
        }
      Event.create!(arguments)
    end
  end

  def self.append_cargoes
    if @obl.nil? == false
      @append_cargoes = Fixture_cargo.where(obl: @obl)
    elsif @berth.nil? == false
      @append_cargoes = Fixture_cargo.where(berth: @berth)
    elsif @terminal.nil? == false
      @append_cargoes = Fixture_cargo.where(terminal: @terminal)
    else
      @append_cargoes = Fixture_cargo.where(port: @port)
    end
  end
end
