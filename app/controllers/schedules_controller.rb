class SchedulesController < ApplicationController
  def index
    @schedules = current_user.schedules
    @locations = current_user.locations
  end

  def create
    @schedule = current_user.schedules.new(schedule_params)
    if @schedule.save
      flash[:success] = "Schedule created successfully."
      redirect_to schedules_path
    else
      flash[:info] = "Unable to create schedule."
      redirect_to schedules_path
    end
  end

  def show
    @schedule = Schedule.find_by_id(params[:id])
  end

  def destroy
    schedule = Schedule.find_by_id(params[:id])
    schedule.destroy
    flash[:danger] = "Schedule deleted."
    redirect_to schedules_path
  end

  private

  def schedule_params
    params.require(:schedule).permit(
      :name,
      :start_date,
      :end_date,
      :user_id,
      :location_id
    )
  end
end
