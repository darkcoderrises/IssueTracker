class ProjectController < ApplicationController
  before_action :require_user, only: [:index, :new, :show, :create]

  def index
    @user = User.find(session[:user_id])
    @projects = @user.projects
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def show
    @project = Project.find(params[:id])

    puts @project.working.detect{|p| p.id == session[:user_id] }
    if check(@project.id) == 0
      redirect_to '/'
    end

    @user = User.find(@project.user_id)
    @issues = @project.issues
    @workers = @project.working
  end

  def add
    @user = User.find(session[:user_id])
    @project = Project.find(params[:id])
    @invite = @user.invite.detect{|i| i.project_id == @project.id}

    if @invite
      @invite.destroy
      Working.create(user_id: @user.id, project_id: @project.id)
    else
      redirect_to "/"
    end
  end

  def remove
    @project = Project.find(params[:id])
    @user = User.find(params[:rem])

    @working = @project.working.detect{|p| p.user_id == @user.id}
    if @working
      @working.destroy
    end

    redirect_to "/project/#{@project.id}"
  end

  def create
    @project = Project.new(project_params)
    @user = User.find(session[:user_id])
    @user.projects << @project
    Working.create(user_id: @user.id, project_id: @project.id)
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
    params.require(:project).permit(:name, :description, :private)
  end

  def check(x)
    @project = Project.find(x)

    if @project.private == 0
      return 1
    end

    if @project.working.detect{|p| p.user_id == session[:user_id] }
      return 1
    else
      return 0
    end
  end
end
