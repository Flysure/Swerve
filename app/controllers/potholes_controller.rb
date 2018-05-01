class PotholesController < ApplicationController

  def create
    @pothole = Pothole.new(latitude:params[:pothole][:latitude],
      longitude:params[:pothole][:longitude],
      user_id:params[:pothole][:user_id],
      description:params[:pothole][:comment],
      severity:params[:pothole][:severity])
    @pothole.save
  end
  def index
    @distance = 25;
    @pothole = Pothole.new
    @potholes = Pothole.all
    @hash = Gmaps4rails.build_markers(@potholes) do |pothole, marker|
      marker.lat pothole.latitude
      marker.lng pothole.longitude
      marker.infowindow render_to_string(:partial => "/potholes/infowindow", :locals => { :pothole => pothole})
    end
  end
  def show
    @pothole = Pothole.find(params[:id])
  end
  def locate
  if !params[:coords][:lat].nil?
    @lat = params[:coords][:lat];
    @lng = params[:coords][:lng];
    @distance = 25
    @holes = Pothole.near([@lat, @lng], @distance);
  end
end
end
