class Pothole < ApplicationRecord
  belongs_to :user
  reverse_geocoded_by :latitude, :longitude, :address => :loc  # ActiveRecord
  after_validation :reverse_geocode  # auto-fetch address
end
