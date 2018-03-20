class PotholesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @pothole = Pothole.new(latitude:params[:latitude], longitude:params[:longitude], user_id:params[:user_id])
    @pothole.save
  end
  def index
    @potholes = Pothole.all
    @hash = Gmaps4rails.build_markers(@potholes) do |pothole, marker|
      marker.lat pothole.latitude
      marker.lng pothole.longitude
    end
    @user = Pothole.last.user;
  end
end
