class Request < ApplicationRecord

  has_one :delivery
  validates :order_number, :delivery_address, presence: true

end
