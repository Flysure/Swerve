class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # This lets us use methods from the helpers in our controllers to make code readable
  include SessionsHelper
  include PotholesHelper
end
