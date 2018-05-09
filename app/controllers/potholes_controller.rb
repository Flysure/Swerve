class PotholesController < ApplicationController
# Reached when user submits pothole on map, then views/potholes/create.js.erb runs
  def create
    @pothole = Pothole.new(potholes_params)
    @pothole.save
  end
# /potholes main page. See index.html.erb and render_map
  def index
    @width_options = [["6 inches - a baby pothole",0.5], ["1 ft - size of toaster",1],
                  ["2 ft - crater sized", 2]]
    @severity_options =   [
  ["1 - Very minor annoyance", 1],
  ["2 - Minor annoyance-occasional",2],
  ["3 - Annoying enough to be distracting",3],
  ["4 - Can be ignored if you are really involved in your work",4],
  ["5 - Can’t be ignored for more than 30 minutes.",5],
  ["6 - Can’t be ignored for any length of time",6],
  ["7 - Make it difficult to concentrate, interferes with sleep",7],
  ["8 - Physical activity severely limited.",8],
  ["9 - Unable to speak - pain makes you pass out",9],
  ["10 - Unconscious. Pain makes you pass out.",10]]
  @autho_options = [
    ["Authorites not contacted", 1],
    ["Authorities contacted but taking too long", 2],
    ["Authorities contacted and on their way", 3]
  ]
    @distance = 10;
    @pothole = Pothole.new
  end
  # Pothole profile page, see views/potoles/show.html.erb
  def show
    @pothole = Pothole.find(params[:id])
  end
  # Retrieves user location from ajax, drops markers, see locate.js.erb
  def locate
    session[:lat] = params[:coords][:lat]
    session[:lng] = params[:coords][:lng]
    @distance = 10;
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
