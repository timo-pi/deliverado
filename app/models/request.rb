class Request < ApplicationRecord
  has_one :delivery, dependent: :destroy
  belongs_to :store, dependent: :destroy
  validates :order_number, :delivery_address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_delivery_address?
  enum status: { pending: 0, accepted: 1, declined: 2 }

  def distance_to_delivery(loc2)
    loc1 = [latitude, longitude]

    rad_per_deg = Math::PI/180  # PI / 180
    rkm         = 6371          # Earth radius in kilometers
    rm          = rkm * 1000    # Radius in meters

    dlat_rad    = (loc2[0]-loc1[0]) * rad_per_deg # Delta, converted to rad
    dlon_rad    = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad    = loc1.map {|i| i * rad_per_deg }.first
    lat2_rad    = loc2.map {|i| i * rad_per_deg }.first

    a           = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c           = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    return rm * c /1000 # Delta in meters
  end

  private

  def address
    [delivery_address, city].compact.join(', ')
  end
end

