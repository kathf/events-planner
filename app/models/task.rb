class Task < ActiveRecord::Base
  belongs_to :event
  belongs_to :contact

  def self.tasks_this_day(date)
    where( 'deadline > ? AND deadline < ?', date.beginning_of_day, date.end_of_day )
  end

end
