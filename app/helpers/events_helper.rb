module EventsHelper

  def event_comment_if_exists
    if @event.comment
      @event.comment
    end
  end

end
