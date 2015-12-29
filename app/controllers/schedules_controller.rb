class SchedulesController < ApplicationController
  def index
    @schedules = current_user.schedules
    @locations = current_user.locations
  end

  def create
    @schedule = current_user.schedules.new(schedule_params)
    if @schedule.save
      redirect_to schedules_path, alert: "Schedule created successfully."
    else
      redirect_to schedules_path, alert: "Unable to create schedule."
    end
  end

  def show
    @schedule = Schedule.find_by_id(params[:id])
  end

  def destroy
    schedule = Schedule.find_by_id(params[:id])
    schedule.destroy
    redirect_to schedules_path, alert: "Schedule deleted."
  end

  private

  def schedule_params
    params.require(:schedule).permit(:name, :start_date, :end_date, :user_id,
      :location_id)
  end
end