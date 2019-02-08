class Delivery < ApplicationRecord
  belongs_to :request
  belongs_to :user
  enum status: { accepted: 0, pickedup: 1, ontheway: 2, delivered: 3 }

end
