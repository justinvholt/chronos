class ProcService
  def initialize(clause)
    @clause = clause
  end

  def call(event)
    @event = event
    @event_title = @event.title.strip.downcase
    send(@clause.bloc)
  end

  def response(package = nil)
    response = Hash.new
    if package.class == String
      response[:message] = "mutate event"
      response[:mutation] = package
    elsif package.class == Event
      reponse[:message] = "insert event"
      response[:event] = package
    else
      response[:message] = "no action required"
    end
    return response
  end

  ## method missing / ghost method

  private

  def nor_6_asbatankvoy
    @event_title == "nor tendered" ? response("Laytime starts") : response()
  end

  def hoses_11_asbatankvoy
    @event_title == "cargo documents on board" ? response("Laytime stops") : response()
  end
end
