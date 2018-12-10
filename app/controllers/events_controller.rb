class EventsController < ApplicationController
  before_action :set_fixture, only: [:run_chronos, :import, :index, :all_fixture_events]

  def import
    ImportSOFJob.perform_now(params[:file], @fixture)
    redirect_to fixture_events_path(@fixture), notice: "SOF data imported"
  end

  def run_chronos
    set_clause_group
    assess_events_clauses
    assess_events_laytime
    cumilative_laytime
    calculate_demurrage
  end

  def index
    all_fixture_events
    set_allowed_laytime
    group_events
    run_chronos
    @port_events
  end

  private

  def assess_events_clauses
    @port_events.each do |port, terminals|
      terminals.each do |terminal, events|
        events.each do |event|
          @event = event
          assess_clauses(event)
        end
      end
    end
  end

  def assess_clauses(event)
    @clause_group.each do |clause|
      read_response(clause.bloc_call(event))
    end
  end

  ## TODO: Why does it run twice over this method?
  def read_response(response)
    case response[:message]
    when "mutate event"
      @event.counting = response[:mutation]
    when "insert event"
      @events << response[:event]
    end
  end

  def assess_events_laytime
    @port_events.each do |port, terminals|
      terminals.each do |terminal, events|
        events.each do |event|
          @event = event
          calculate_laytime(event)
        end
      end
    end
  end

  def calculate_laytime(event)
    @start_datetime = event.datetime if event.counting == "Laytime starts"
    @end_datetime = event.datetime if event.counting == "Laytime stops"
    if event.counting == "Laytime stops"
      @event.laytime = TimeDifference.between(@end_datetime, @start_datetime).in_minutes
    end
  end

  def cumilative_laytime
    @total_laytime = 0.to_f

    @port_events.each do |port, terminals|
      @port = port
      terminals.each do |terminal, events|
        events.each do |event|
          if event.laytime > 0
            @laytime_summary[@port][:used] += event.laytime
            @total_laytime += event.laytime
          end
        end
      end
    end
    @laytime_summary[:total][:used] = @total_laytime
    time_on_demurrage
  end

  def time_on_demurrage
    @laytime_summary.each do |port, mins|
      if mins[:used] != nil && mins[:allowed] != nil
        on_demurrage = mins[:used] - mins[:allowed]
        @laytime_summary[port][:on_dem] = on_demurrage if on_demurrage > 0.to_f
      end
    end
  end

  def calculate_demurrage
    if @laytime_summary[:total][:on_dem].nil?
      @demurrage = 0
    else
      @demurrage = @laytime_summary[:total][:on_dem] * ( @fixture.demurrage_rate / 1440 )
    end
  end

  ## setting up

  def all_fixture_events
    @handlings = Set.new
    @events_set = Set.new
    @cargoes = FixtureCargo.where(fixture: @fixture)

    @cargoes.each do |cargo|
      cargo.cargo_handlings.each { |handling| @handlings << handling }
    end

    @handlings.each { |handling| @events_set << handling.event } if @handlings.length > 0
    @events = order_by_time(@events_set.to_a)
  end

  def group_events
    @port_events = @events.group_by(&:port).transform_values do |events|
      events.group_by(&:terminal)
    end
  end

  def order_by_time(events_array)
    events_array.sort_by! {|event| event.datetime }
  end

  def set_clause_group
    @clause_group = Clause.all[0..1]
    # @clause_group = ClauseGroup.where(fixture: @fixture).clauses
  end

  def set_fixture
    @fixture = Fixture.find(params[:fixture_id])
  end

  def set_allowed_laytime
    @laytime_summary = Hash.new
    @cargoes.each do |cargo|
      @laytime_summary[cargo.load_port] = {used: 0.to_f}
      @laytime_summary[cargo.disch_port] = {used: 0.to_f}
    end
    @laytime_summary[:total] = {allowed: @fixture.allowed_laytime.to_f * 60}
  end
end
