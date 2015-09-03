class ProjectController < ApplicationController
  before_action :require_user, only: [:index, :new, :show, :create]

  def index
    @user = ProjectOwner.find(session[:user_id])
    @use1 = ProjectsUser.find(session[:user_id])
    @projects = @use1.projects
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def show
      @project = Project.find(params[:id])
      @user = User.find(@project.project_owner_id)
      @issues = @project.issues
  end

  def create
    @project = Project.new(project_params)
    @user = User.find(session[:user_id])
    @project.project_owner_id = session[:user_id]
    if @project.save
      redirect_to '/'
    else
      redirect_to '/project/create'
    end
  end

  def update
    respond_to do |format|
      if @project.update(issue_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
