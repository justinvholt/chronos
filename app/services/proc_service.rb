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
    events.each { |event| @terminal_events[event.title] = event }
  end

  def response(message = "")
    return message
  end

  ## method missing / ghost method

  private

  ### COMMENCEMENT###

  def start_nor_6
    if @event.title == "NOR tendered"
      @nor_6_handlings = []
      @event.cargo_handlings.each do |handling|
        @nor_6_handlings << CargoHandling.create(fixture_cargo: handling.fixture_cargo)
      end

      @event.datetime + 6.hour < @terminal_events["Berthed"].datetime
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
      response("notice time starts")
    else
      response()
    end
  end

  def start_nor
    @event.title == "NOR tendered" ? response("Laytime starts") : response()
  end

  ### COMMENCEMENT###

  # def stop_shifting_anchorage
  #   @event.title == "Anchor Aweigh" ? response("Laytime stops") : response()
  # end

  def stop_documents
    @event.title == "Cargo Documents on Board" ? response("Laytime stops") : response()
  end
end


