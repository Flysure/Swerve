module PotholesHelper
  def gmaps4rails_infowindow(pothole)
        "<i> #{pothole.loc}
      <p>severity: #{ pothole.severity}</p>
      <p>depth: #{pothole.depth}
      ft width:#{ pothole.width}ft </p>
        <i>#{pothole.description}</i>"
    end
end
