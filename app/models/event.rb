class Event < ApplicationRecord
  belongs_to :creator, class_name: :User, foreign_key: :creator_id

  scope :past, -> { where("event_date < ?", Time.now).order("event_date DESC") }
  scope :upcoming, -> { where("event_date > ?", Time.now).order("event_date DESC") }
end
