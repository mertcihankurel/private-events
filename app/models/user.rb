class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id, dependent: :destroy
  has_many :event_attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendances, source: :attended_event

  validates :name, presence: true, length: { minimim: 3, maximum: 10 }
  validates :email, format: { with: /\w+@\w+\.{1}[a-zA-Z]{2,}/ }, uniqueness: true
end
