module PotholesHelper
  def dropMarkers
    @hash = Gmaps4rails.build_markers(@potholes) do |pothole, marker|
      marker.lat pothole.latitude
      marker.lng pothole.longitude
      marker.infowindow render_to_string(:partial => "/potholes/partials/infowindow", :locals => { :pothole => pothole})
    end
  end
end
