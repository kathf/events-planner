module EventsHelper

  def event_comment_if_exists
    if @event.comment
      @event.comment
    end
  end

  def days_this_week
    arr = []
    day = Date.today.beginning_of_week

    0.upto(6) do |num|
      arr << day + num
    end
    arr
  end

  # this method is for the month view - not yet working
  def days_this_month
    arr = []
    start_day = Date.today.beginning_of_month.beginning_of_week # returns the date of the Monday before or on the first day of the month
    end_day = Date.today.end_of_month.end_of_week

    days = (end_day - start_day).to_i

    1.upto(days) do |num|
      arr << start_day + num
    end
    arr
  end

end
