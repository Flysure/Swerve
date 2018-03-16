class SessionsController < ApplicationController
  def new
  end
  def create

    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "You're logged in!"
      redirect_to map_path
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end
  def destroy
    log_out
    redirect_to root_path
  end
end
