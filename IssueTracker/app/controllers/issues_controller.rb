class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.all
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  def voteadd
    @issue = Issue.find(params[:id])
    @user = User.find(session[:user_id])
    @project = @issue.project

    if @project.working.detect{|p| p.user_id == @user.id} && !@user.votes.detect{|v| v.issue_id == @issue.id}
      Vote.create(user_id: session[:user_id], issue_id:params[:id])
    end

    redirect_to "/issues/#{@issue.id}"
  end

  def voterem
    @issue = Issue.find(params[:id])
    @user = User.find(session[:user_id])

    @vote = @user.votes.detect{|v| v.issue_id == @issue.id}
    if @vote
      @vote.destroy
    end
    redirect_to "/issues/#{@issue.id}"
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|

      @project = Project.find(params[:id])
      @project.issues << @issue
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }

        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:heading, :description, :status, :open)
    end
end
