class EventsController < ApplicationController
  before_action :set_fixture, only: [:run_chronos, :import, :index]

  def import
    ImportSOFJob.perform_now(params[:file], @fixture)
    redirect_to fixture_events_path(@fixture), notice: "SOF data imported"
  end

  def run_chronos
  end

  def index
    @port_events = Event.all.group_by(&:port)
  end

  def port_events
    @port_events = Event.all.group_by(&:port)
  end

  def order_events
    #sort and group!!
    # @events.sort_by! {|event| event.datetime }
  end

  # def assess_terms(contract)
  #   #maybe better to make @events a hash and pass that an argument to the block_call?
  #   #set this based on fixture instead of contract @fixture.clause_group
  #   @events.each do |event|
  #     contract.each do |term|
  #       if term.block_call(event).class == Event
  #         @events << term.block_call(event)
  #       else
  #         event.counting = term.block_call(event) unless term.block_call(event).nil?
  #       end
  #     end
  #   end
  # end

  # def calculate_laytime
  #   @events.each do |event|
  #     @start_datetime = event.datetime if event.counting == "Laytime starts"
  #     @end_datetime = event.datetime if event.counting == "Laytime stops"
  #     event.laytime = TimeDifference.between(@end_datetime, @start_datetime).in_general if event.counting == "Laytime stops"
  #   end
  # end

  private

  def set_fixture
    @fixture = Fixture.find(params[:fixture_id])
  end
end
