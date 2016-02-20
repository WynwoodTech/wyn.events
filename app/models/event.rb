class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :organizer

  validates :organizer, :start_time, :end_time, presence: true
  validates :title, presence: true, length: { minimum: 3 }
  validate :event_time

  private

  def event_time
    if start_time && end_time && (start_time > end_time)
      errors.add(:end_time, "can't be before start_time")
    end
  end
end
