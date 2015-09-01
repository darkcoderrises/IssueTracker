class ProjectController < ApplicationController
  before_action :require_user, only: [:index, :new, :show, :create]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
      @project = Project.find(params[:id])
      @user = User.find(session[:user_id])
  end

  def create
    @project = Project.new(project_params)
    @user = User.find(session[:user_id])
    if @project.save
      @user.projects << @project
      redirect_to '/'
    else
      redirect_to '/project/create'
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
