class Route < ApplicationRecord
  belongs_to :user
  validates :start_address, :end_address, :delivery_radius, presence: true
end
