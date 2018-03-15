class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name,
         :born_on, :username, :password, :password_confirmation, :email)
    end

end
