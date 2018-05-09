class PotholesController < ApplicationController

  def create
    @pothole = Pothole.new(potholes_params)
    @pothole.save
  end

  def index
    @distance = 25;
    @pothole = Pothole.new
  end
  def show
    @pothole = Pothole.find(params[:id])
  end
  def locate
    @lat = params[:coords][:lat];
    @lng = params[:coords][:lng];
    @distance = 25;
    @holes = Pothole.near([@lat, @lng], @distance);
    build_markers
end
def bounds
  coords = Geocoder.coordinates(params[:location]);
  @lat = coords[0];
  @lng = coords[1];
end
def home
  @lat = params[:coords][:latitude];
  @lng = params[:coords][:longitude];
end
def potholes_params
      params.require(:pothole).permit(:latitude, :longitude, :user_id,
                                   :description, :severity, :width, :depth,
                                   :authorites_contacted)
    end
end
