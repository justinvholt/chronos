class EventsController < ApplicationController
  before_action :set_fixture, only: [:run_chronos]

  def import_sof(csv_file_path)
    @events = []

    CSV.foreach(@csv_file_path) do |row|
      arguments = {
        port: row[0],
        terminal: row[1],
        berth: row[2],
        title: row[3],
        datetime: Time.parse("#{row[4]}, #{row[5]}:00, 0"),
        fixture_cargo: #find based on OBL number,
        counting: "", #add this to model
        laytime: Hash.new #add this to model
        }
      @events << Event.new(arguments)
      order_events
    end
  end

  def run_chronos
    order_events
    assess_terms(@clause_group)
    order_events
    calculate_laytime
  end

  private

  def set_fixture
    @fixture = Fixture.find(params[:id])
  end
end
