class TeamMembersController < ApplicationController
  before_action :authenticate_user

  def index
    @team_members = current_user.team_members.order("last_name")
  end

  def new
    @team_member = TeamMember.new
  end

  def create
    params["team_member"]["user_id"] = current_user.id
    @team_member = TeamMember.create(team_member_params)
    respond_to do |format|
      format.js
    end
  end

  def update
    @team_member = TeamMember.find(params[:id])
    @team_member.update_attributes(team_member_params)
  end

  def edit
    @team_member = TeamMember.find(params[:id])
  end

  def destroy
    @team_member = TeamMember.find_by_id(params[:id])
    @team_member.destroy
    respond_to do |format|
      format.html { redirect_to team_members_path }
      format.js
    end
  end

  private

  def team_member_params
    params.require(:team_member).permit(
      :first_name,
      :last_name,
      :user_id
    )
  end
end
