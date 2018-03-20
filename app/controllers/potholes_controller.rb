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
      marker.infowindow render_to_string(:partial => "/potholes/my_template", :locals => { :@pothole => pothole})
      ##marker.infowindow "<b>Pothole created by #{pothole.user.username}</b>"
    end
  end
end
