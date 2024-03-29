class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @user = User.find(session[:user_id])
    @projects = @user.projects
    @invites = @user.invite
    @workings = @user.working
  end

  def create
    @user = User.new(user_param)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private
  def user_param
    params.require(:user).permit(:first_name, :last_name, :email, :password)

  end
end
