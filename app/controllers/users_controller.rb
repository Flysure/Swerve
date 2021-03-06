class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if @user.update_attributes(user_params)
     flash[:success] = "Profile updated!"
     redirect_to @user
   else
     render 'edit'
   end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to SWERVE!"
      redirect_to potholes_path
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name,
         :born_on, :username, :password, :password_confirmation, :email)
    end

end
