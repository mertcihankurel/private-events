class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id, dependent: :destroy

  validates :name, presence: true, length: { minimim: 3, maximum: 10 }
  validates :email, format: { with: /\w+@\w+\.{1}[a-zA-Z]{2,}/ }, uniqueness: true
end
