class Pothole < ApplicationRecord
  belongs_to :user
  reverse_geocoded_by :latitude, :longitude, :address => :loc  # ActiveRecord
  after_validation :reverse_geocode  # auto-fetch address


  # CONSTANTS that are used for options in dropdowns

  WIDTH = [["6 inches - a baby pothole",0.5], ["1 ft - size of toaster",1],
                ["2 ft - crater sized", 2]]

  AUTHO = [["Authorites not contacted", 1],
           ["Authorities contacted but taking too long", 2],
           ["Authorities contacted and on their way", 3]]

  SEVERITY = [["1 - Very minor annoyance", 1],
              ["2 - Minor annoyance-occasional",2],
              ["3 - Annoying enough to be distracting",3],
              ["4 - Can be ignored if you are really involved in your work",4],
              ["5 - Can’t be ignored for more than 30 minutes.",5],
              ["6 - Can’t be ignored for any length of time",6],
              ["7 - Make it difficult to concentrate, interferes with sleep",7],
              ["8 - Physical activity severely limited.",8],
              ["9 - Unable to speak - pain makes you pass out",9],
              ["10 - Unconscious. Pain makes you pass out.",10]]

SORTING = [["Closest to farthest", "distance"],
           ["Severity", "severity"]]
end
