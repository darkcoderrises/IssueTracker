class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :edit, :update, :destroy]

  # GET /invites
  # GET /invites.json
  def index
    @invites = Invite.all
  end

  # GET /invites/1
  # GET /invites/1.json
  def show
  end

  # GET /invites/new
  def new
    @invite = Invite.new
  end

  # GET /invites/1/edit
  def edit
  end

  def add
    @invite = Invite.find(:invite_id)
    if @invite.user_id = session[:user_id]
      @invite.destroy
    end
  end

  # POST /invites
  # POST /invites.json
  def create
    @project = Project.find(params[:invite][:project_id])
    if @project.user_id == session[:user_id] && params[:invite][:user_id] != @project.user_id
      @invite = Invite.new(invite_params)

      respond_to do |format|
        if @invite.save
          format.html { redirect_to @invite, notice: 'Invite was successfully created.' }
          format.json { render :show, status: :created, location: @invite }
        else
          format.html { render :new }
          format.json { render json: @invite.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /invites/1
  # PATCH/PUT /invites/1.json
  def update
    if @invite.project.user_id == session[:user_id]
      respond_to do |format|
        if @invite.update(invite_params)
          format.html { redirect_to @invite, notice: 'Invite was successfully updated.' }
          format.json { render :show, status: :ok, location: @invite }
        else
          format.html { render :edit }
          format.json { render json: @invite.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.json
  def destroy
    if @invite.user_id == session[:user_id] || @invite.project.user_id == session[:user_id]
      @invite.destroy
      respond_to do |format|
        format.html { redirect_to invites_url, notice: 'Invite was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      @invite = Invite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invite_params
      params.require(:invite).permit(:user_id, :project_id)
    end
end
