module PotholesHelper
  def gmaps4rails_infowindow(pothole)
        "<i> #{pothole.loc}
      <p>severity: #{ pothole.severity}</p>
      <p>depth: #{pothole.depth}
      ft width:#{ pothole.width}ft </p>
        <i>#{pothole.description}</i>"
    end
  def build_markers
    @hash = Gmaps4rails.build_markers(@holes) do |pothole, marker|
      marker.lat pothole.latitude
      marker.lng pothole.longitude
      marker.infowindow gmaps4rails_infowindow(pothole)
    end
  end


end
