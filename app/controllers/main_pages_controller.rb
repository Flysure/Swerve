class MainPagesController < ApplicationController
  def map
    @potholes = Pothole.all
    @hash = Gmaps4rails.build_markers(@potholes) do |pothole, marker|
      marker.lat pothole.latitude
      marker.lng pothole.longitude
    end
  end
end
