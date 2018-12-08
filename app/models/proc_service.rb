class State
  def initialize(title = "")
    @title = title
  end

  def to_s
    @title
  end
end

class ProcService
  def initialize(clause)
    @clause = clause
  end

  def call(event)
    @event = event
    @event_title = @event.title.strip.downcase
    send(@clause.bloc) # "laytime start" / "laytime stops"
  end

  ## method missing / ghost method

  def nor_6_asbatankvoy
    if @event_title == "nor tendered"
      State.new("Laytime starts")
      # "Laytime starts"
    else
      State.new()
    end
  end

  def hoses_11_asbatankvoy
     if @event_title == "cargo documents on board"
      State.new("Laytime stops")
    else
      State.new()
    end
  end
end
