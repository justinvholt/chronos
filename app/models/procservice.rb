class ProcService
  def initialize(term)
    @term = term
  end

  def call(event)
    @event = event
    send(@clause.bloc)
  end

  def nor_6_asbatankvoy
    # exp = ["force majeure"]
    commencement = ( "all fast" || "finished mooring" )

    # exempt?(exp, 1)
    notice_of_readiness(6)
    commencement(commencement) unless @effective_notice.nil?
  end

  def hoses_11_asbatankvoy
    completion_event = "hose off"
    completion(completion_event)
  end

  private

  def notice_of_readiness(notice_time = 0)
    if @event_title == "nor tendered"
      notice_time != 0 ? effective_notice(notice_time) : "Laytime starts"
    end
  end

  def effective_notice(notice_time = 0)
    @effective_notice = Event.new(
      port: @event.port,
      title: "NOR + #{notice_time.to_s}",
      counting: "Laytime starts",
      datetime: @event.datetime + notice_time.hours,
      )
  end

  def commencement(commencement)
    if @event_title == commencement
      @event.datetime < @effective_notice.datetime ? "Laytime starts" : @effective_notice
    end
  end

  def completion(completion_event)
    @event_title == completion_event ? "Laytime stops" : nil
  end

end
