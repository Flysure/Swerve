class PotholesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @pothole = Pothole.new(latitude:params[:latitude], longitude:params[:longitude], user_id:params[:user_id])
    @pothole.save
    puts("success")
  end
end
