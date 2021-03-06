class Delivery < ApplicationRecord
  belongs_to :request
  belongs_to :user
  enum status: { accepted: 0, pickedup: 1, ontheway: 2, delivered: 3 }
  validates :request_id, uniqueness: true
  validates :user_id, presence: true
end
