class EventsController < ApplicationController
  before_action :set_fixture, only: [:run_chronos, :import, :index, :all_fixture_events]

  def import
    ImportSOFJob.perform_now(params[:file], @fixture)
    redirect_to fixture_events_path(@fixture), notice: "SOF data imported"
  end

  def run_chronos
    set_clause_group
    assess_terms
    order_events
    # calculate_laytime
  end

  def index
    all_fixture_events
    group_events
    # run_chronos
    @port_events
  end

  def assess_terms
    #TODO stack level to deep!
    #maybe better to make @events a hash and pass that an argument to the bloc_call?
    @laytime_events.each do |port, events|
      events.each do |event|
        @clause_group.each do |clause|
          clause.proc_service = ProcService.new(self)
            if clause.bloc_call(event).class == Event
              @events << clause.bloc_call(event)
            else
              event.counting = clause.bloc_call(event) unless clause.bloc_call(event).nil?
            end
        end
      end
    end
  end

  # def calculate_laytime
  #   @events.each do |event|
  #     @start_datetime = event.datetime if event.counting == "Laytime starts"
  #     @end_datetime = event.datetime if event.counting == "Laytime stops"
  #     event.laytime = TimeDifference.between(@end_datetime, @start_datetime).in_general if event.counting == "Laytime stops"
  #   end
  # end

  private

  def group_events
    order_events
    @laytime_events = @events.group_by(&:port)
    @port_events = @laytime_events.transform_values do |events|
      events.group_by(&:terminal)
    end
  end

  def order_events
    @events.sort_by! {|event| event.datetime }
  end

  def all_fixture_events
    @handlings = Set.new
    @events_set = Set.new
    @cargos = FixtureCargo.where(fixture: @fixture)

    @cargos.each do |cargo|
      cargo.cargo_handlings.each { |handling| @handlings << handling }
    end

    unless @handlings.empty?
      @handlings.each { |handling| @events_set << handling.event }
    end
    @events = @events_set.to_a
  end

  def set_clause_group
    @clause_group = Clause.all
    # @clause_group = ClauseGroup.where(fixture: @fixture).clauses
  end

  def set_fixture
    @fixture = Fixture.find(params[:fixture_id])
  end
end
