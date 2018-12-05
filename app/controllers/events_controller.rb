class EventsController < ApplicationController
  before_action :set_fixture, only: [:run_chronos]

  def import_sof(csv_file_path)
    @events = []

    CSV.foreach(@csv_file_path) do |row|
      port = row[0]
      terminal = row[1]
      berth = row[2]
      obl = row[6]

      arguments = {
        port: port,
        terminal: terminal,
        berth: berth,
        title: row[3],
        datetime: Time.parse("#{row[4]}, #{row[5]}:00, 0"),
        fixture_cargo: append_cargoes(port, terminal, berth, obl),
        counting: "",
        laytime: Hash.new
        }
      @events << Event.new(arguments)
    end
  end

  def append_cargoes(port, terminal, berth, obl)
    if obl.nil? == false
      Fixture_cargo.where(obl: obl)
    elsif berth.nil? == false
      Fixture_cargo.where(berth: berth)
    elsif terminal.nil? == false
      Fixture_cargo.where(terminal: terminal)
    else
      Fixture_cargo.where(port: port)
    end
  end

  def run_chronos

  end

  private

  def set_fixture
    @fixture = Fixture.find(params[:id])
  end
end
