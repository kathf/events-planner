class Task < ActiveRecord::Base
  belongs_to :event
  belongs_to :contact

  accepts_nested_attributes_for :contact
  # motive: to allow adding a contact details when creating a new task

  scope :incomplete, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }
  scope :upcoming, -> { where(deadline: Time.now..1.week.from_now) }
  scope :overdue, -> { where('deadline < ?', Time.now ) }

  def complete!
    self.completed_at = Time.now
    self.completed = true
    self.save!
  end

  def self.tasks_this_day(date)
    where( 'deadline > ? AND deadline < ?', date.beginning_of_day, date.end_of_day )
  end

end
