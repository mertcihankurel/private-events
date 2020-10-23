class Event < ApplicationRecord
  belongs_to :creator, class_name: :User
  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendances, source: :attendee
  has_one_attached :main_image

  validates :description, :title, :event_date, presence: true
  validates :title, length: { minimum: 5, maximum: 20 }

  scope :past, -> { where("event_date < ?", Time.now).order("event_date DESC") }
  scope :upcoming, -> { where("event_date > ?", Time.now).order("event_date DESC") }
end
