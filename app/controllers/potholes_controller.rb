class PotholesController < ApplicationController

  def create
    @pothole = Pothole.new(potholes_params)
    @pothole.save
  end

  def index
    @distance = 10;
    @pothole = Pothole.new
  end
  def show
    @pothole = Pothole.find(params[:id])
  end
  def locate
    session[:lat] = params[:coords][:lat]
    session[:lng] = params[:coords][:lng]
    @distance = 10;
    @holes = Pothole.near([session[:lat], session[:lng]], @distance);
    build_markers
end
def bounds
  coords = Geocoder.coordinates(params[:location]);
  @lat = session[:lat];
  @lng = session[:lng];
end
def home
  @lat = session[:lat];
  @lng = session[:lng];
end
def change_distance
    @distance = params[:distance];
    @holes = Pothole.near([session[:lat], session[:lng]], @distance);
    build_markers
end
def potholes_params
      params.require(:pothole).permit(:latitude, :longitude, :user_id,
                                   :description, :severity, :width, :depth,
                                   :authorites_contacted)
    end
end
