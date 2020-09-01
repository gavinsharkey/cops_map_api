class Incident < ApplicationRecord
  has_many :cases
  validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }

  def self.in_radius(lat, long, radius)
    lat = lat.to_f
    long = long.to_f
    radius = radius.to_f
    self.where('POWER((incidents.latitude - ?), 2) + POWER((incidents.longitude - ?), 2) < POWER(?, 2)', lat, long, radius)
  end
end
