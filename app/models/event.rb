class Event < ActiveRecord::Base
  has_many :tasks
  validates :name, :start, :end, presence: true

end
