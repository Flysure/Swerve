class Pothole < ApplicationRecord
  belongs_to :user
  reverse_geocoded_by :latitude, :longitude, :address => :location  # ActiveRecord
  after_validation :reverse_geocode  # auto-fetch address
end
