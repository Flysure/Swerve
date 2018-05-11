class PotholesController < ApplicationController
# Reached when user submits pothole on map, then views/potholes/create.js.erb runs
  def create
    @pothole = Pothole.new(potholes_params)
    @pothole.save
  end
# /potholes main page. See index.html.erb and render_map
  def index
    @distance = 10;
    @pothole = Pothole.new
  end
  # Pothole profile page, see views/potoles/show.html.erb
  def show
    @pothole = Pothole.find(params[:id])
  end
  # Retrieves user location from ajax, drops markers, see locate.js.erb
  def locate
    session[:sorting] = "asc"
    session[:lat] = params[:coords][:lat]
    session[:lng] = params[:coords][:lng]
    @sorting = "asc"
    @distance = 10;
    session[:distance] = @distance
    @holes = Pothole.near([session[:lat], session[:lng]], @distance);
    build_markers
end
# This is supposed to send you to whatever you type in, TODO NOT WORKING
def bounds
  coords = Geocoder.coordinates(params[:location]);
  @lat = session[:lat];
  @lng = session[:lng];
end
# Buttom that pans to original location, see home.js.erb
def home
  @lat = session[:lat];
  @lng = session[:lng];
end
# Drops markers according to distance, see js.erb file
def change_distance
    @before_dist = session[:distance];
    @distance = params[:distance];
    @holes = Pothole.near([session[:lat], session[:lng]], @distance);
    build_markers
end
def change_sorting
  @sort = params[:sorting]
  @distance = session[:distance];
  if(@sort == "sev")
    @holes = Pothole.near([session[:lat], session[:lng]], @distance, :order => :severity);
  elsif(@sort == "asc")
    @holes = Pothole.near([session[:lat], session[:lng]], @distance);
  end

end
def potholes_params
      params.require(:pothole).permit(:latitude, :longitude, :user_id,
                                   :description, :severity, :width, :depth,
                                   :authorites_contacted)
    end
end
