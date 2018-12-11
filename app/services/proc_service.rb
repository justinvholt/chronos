class ProcService
  def initialize(clause)
    @clause = clause
  end

  def call(event, terminal_events)
    @event = event
    hashify_events(terminal_events)
    send(@clause.bloc)
  end

  def hashify_events(events)
    @terminal_events = Hash.new
    events.each do |event|
      if @terminal_events.key?(event.title)
        @terminal_events[event.title] << event
      else
        @terminal_events[event.title] = [event]
      end
    end

    @terminal_events.transform_values! do |event_array|
      event_array.length == 1 ? event_array.first : event_array
    end
  end

  private

  ### COMMENCEMENT###

  def start_nor_6
    if @event.title == "NOR tendered"
      @event.counting = "notice time starts"
      @event.save
      @nor_6_handlings = []
      @event.cargo_handlings.each do |handling|
        @nor_6_handlings << CargoHandling.create(fixture_cargo: handling.fixture_cargo)
      end

      if @event.datetime + 6.hour < @terminal_events["Berthed"].datetime

        nor_6 = Event.create(
          title: "NOR Tendered + 6",
          datetime: @event.datetime + 6.hour,
          port: @event.port,
          terminal: @event.terminal,
          berth: @event.berth,
          vessel_name: @event.vessel_name,
          voyage_number: @event.voyage_number,
          counting: "Laytime starts",
          laytime: 0.0,
          cargo_handlings: @nor_6_handlings,
          dummy: true
          )
      else
        berthed = @terminal_events["Berthed"]
        berthed.counting = "Laytime starts"
        berthed.save
      end
    end
  end

  def berthed
    if @event.title == "Berthed"
      @event.counting = "Laytime starts"
      @event.save
    end
  end

  def start_nor
    if @event.title == "NOR tendered"
      @event.counting = "Laytime starts"
      @event.save
    end
  end

  ### STOP ###

  def stop_documents
    if @event.title == "Cargo Documents on Board"
      @event.counting = "Laytime stops"
      @event.save
    end
  end

  def stop_hose_disconnected
    if @event.title == "Hose Disconnected"
      hose_off_events = @terminal_events["Hose Disconnected"]
      last_disconnect = hose_off_events.max_by(&:datetime)

      last_disconnect.counting = "Laytime stops"
      last_disconnect.save
    end
  end

  ### SUSPENSION ##

  def susp_shifting_anchorage
    if @event.title == "Anchor Aweigh"
      @event.counting = "Laytime stops"
      @event.save

      berthed = @terminal_events["Berthed"]
      berthed.counting = "Laytime starts"
      berthed.save
    end
  end
end
