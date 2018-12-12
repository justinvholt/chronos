class EventsController < ApplicationController
  before_action :set_fixture, only: [:run_chronos, :import, :index, :all_fixture_events]

  def import
    ImportSOFJob.perform_now(params[:file], @fixture)
    redirect_to fixture_events_path(@fixture), notice: "SOF data imported"
  end

  def run_chronos
    ##TODO: This needs some refactoring, DRY
    all_fixture_events
    reset_events_attributes
    set_allowed_laytime
    group_events

    set_clause_group
    assess_events_clauses

    all_fixture_events
    group_events
    assess_events_laytime

    cumulative_demurrage
    calculate_demurrage
    redirect_to fixture_events_path(@fixture), notice: "Laytime calculation updated"
  end

  def index
    all_fixture_events
    set_allowed_laytime if @laytime_summary.nil?
    group_events
    @port_events
    cumulative_demurrage
    calculate_demurrage
  end

  private

  def assess_events_clauses
    @port_events.each do |port, terminals|
      terminals.each do |terminal, events|
        @terminal_events = events
        events.each do |event|
          @event = event
          assess_clauses(event, @terminal_events)
        end
      end
    end
  end

  def assess_clauses(event, terminal_events)
    @clause_group.each do |clause|
      clause.bloc_call(event, terminal_events)
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
    if event.counting == "Laytime stops" && @start_datetime != nil
      @event.laytime = TimeDifference.between(@end_datetime, @start_datetime).in_minutes
      @event.save
    end
  end

  def cumulative_demurrage
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
        @laytime_summary[port][:on_dem] = on_demurrage if on_demurrage > 0
      end
    end
  end

  def calculate_demurrage
    if @laytime_summary[:total][:on_dem] != nil
      @fixture.total_demurrage = (@laytime_summary[:total][:on_dem] * ( @fixture.demurrage_rate / 1440 )).round(2)
      @fixture.save
    end
  end

  ## setting up

  def set_allowed_laytime
    @laytime_summary = Hash.new
    @cargoes.each do |cargo|
      @laytime_summary[cargo.load_port] = {used: 0.to_f}
      @laytime_summary[cargo.disch_port] = {used: 0.to_f}
    end
    @laytime_summary[:total] = {allowed: @fixture.allowed_laytime.to_f * 60}
  end

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

  def reset_events_attributes
    destroyables = []
    @events.each do |event|
      destroyables << event if event.dummy == true
      event.counting = ""
      event.laytime = 0.to_f
      event.save
    end
    @events.reject! { |event| event.dummy == true }
    destroyables.each { |dummy_event| dummy_event.destroy! }
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
    @clause_group = @fixture.clause_group.clauses
  end

  def set_fixture
    @fixture = Fixture.find(params[:fixture_id])
  end
end
