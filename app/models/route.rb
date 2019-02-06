class Route < ApplicationRecord
  belongs_to :user
  validates :start_address, :end_address, :delivery_radius, presence: true
  geocoded_by :start_address, latitude: :start_latitude, longitude: :start_longitude
  geocoded_by :end_address, latitude: :end_latitude, longitude: :end_longitude
  before_save :geocode_endpoints

  private

  def geocode_endpoints
    if start_address_changed?
      geocoded = Geocoder.search(start_address).first
      if geocoded
        self.start_latitude = geocoded.latitude
        self.start_longitude = geocoded.longitude
      end
    end
    if end_address_changed?
      geocoded = Geocoder.search(end_address).first
      if geocoded
        self.end_latitude = geocoded.latitude
        self.end_longitude = geocoded.longitude
      end
    end
  end
end
