class Event < ApplicationRecord
  belongs_to :creator, class_name: :User, foreign_key: :creator_id
  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendances, source: :attendee
  has_one_attached :main_image

  scope :past, -> { where("event_date < ?", Time.now).order("event_date DESC") }
  scope :upcoming, -> { where("event_date > ?", Time.now).order("event_date DESC") }
end
