class Request < ApplicationRecord
  has_one :delivery, dependent: :destroy
  belongs_to :store, dependent: :destroy
  validates :order_number, :delivery_address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_delivery_address?
  enum status: { pending: 0, accepted: 1, declined: 2 }

  private

  def address
    [delivery_address, city].compact.join(', ')
  end
end
