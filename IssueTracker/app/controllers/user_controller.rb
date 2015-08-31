class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @a = User.class
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      redirect_to signup_url
    end
  end

  private
  def user_params
    params.require(:users).permit(:first_name, :last_name, :email, :password_digest)
  end
end
