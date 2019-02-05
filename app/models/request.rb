class Request < ApplicationRecord
  # has_many :deliveries ??
  validates :order_number, :delivery_address, presence: true
end
