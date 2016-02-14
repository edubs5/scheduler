class SchedulesController < ApplicationController
  def index
    @schedules = current_user.schedules
    @locations = current_user.locations
  end

  def new
    @schedule = Schedule.new()
    @locations = current_user.locations
  end

  def create
    @schedule = current_user.schedules.new(schedule_params)
    @schedule.user_id = current_user.id
    set_schedule_dates
    if @schedule.save
      flash[:success] = "Schedule created successfully."
      redirect_to schedules_path
    else
      flash[:info] = "Unable to create schedule."
      redirect_to schedules_path
    end
  end

  def show
    @schedule = Schedule.friendly.find(params[:id])
    if request.path != schedule_path(@schedule)
      redirect_to @schedule, status: :moved_permanently
    end
  end

  def destroy
    schedule = Schedule.find_by_id(params[:id])
    schedule.destroy
    flash[:danger] = "Schedule deleted."
    redirect_to schedules_path
  end

  def set_schedule_dates
    @schedule.start_date = format_date(params["schedule"]["start_date"])
    @schedule.end_date = format_date(params["schedule"]["end_date"])
  end

  def format_date(date_string)
    date_ary = date_string.split(" - ")
    "#{date_ary[0]}/#{date_ary[1]}/#{date_ary[2]}".to_date
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
