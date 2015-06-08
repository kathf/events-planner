class Event < ActiveRecord::Base
  has_many :tasks
  has_many :contacts
  validates :name, :start, :end, presence: true

  scope :incomplete, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }


  def complete!
    self.completed_at = Time.now
    self.completed = true
    self.save!
  end

end
