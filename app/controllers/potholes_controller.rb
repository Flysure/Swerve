class PotholesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @pothole = Pothole.new(latitude:params[:pothole][:latitude],
      longitude:params[:pothole][:longitude],
      user_id:params[:pothole][:user_id],
      description:params[:pothole][:comment],
      severity:params[:pothole][:severity])
    @pothole.save
    redirect_back(fallback_location: potholes_path)
  end
  def index
    @potholes = Pothole.all
    @hash = Gmaps4rails.build_markers(@potholes) do |pothole, marker|
      marker.lat pothole.latitude
      marker.lng pothole.longitude
      marker.infowindow render_to_string(:partial => "/potholes/my_template", :locals => { :@pothole => pothole})
    end
  end
  def show
    @pothole = Pothole.find(params[:id])
  end
end
