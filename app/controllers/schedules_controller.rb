class SchedulesController < ApplicationController
  before_action :authenticate_user
  after_action :verify_authorized, except: [:set_schedule_dates,
                                            :set_start_date, :set_end_date ]

  def index
    @schedules = current_user.schedules.order('name')
    @locations = current_user.locations
    authorize Schedule
  end

  def new
    @schedule = Schedule.new
    @locations = current_user.locations
    authorize @schedule
  end

  def create
    params["schedule"]["user_id"] = current_user.id
    set_schedule_dates
    @schedule = Schedule.create(schedule_params)
    authorize @schedule
    respond_to do |format|
      format.js
    end
  end

  def update
    @schedule = Schedule.friendly.find(params[:id])
    authorize @schedule
    set_schedule_dates
    @schedule.update_attributes(schedule_params)
  end

  def show
    @schedule = Schedule.friendly.find(params[:id])
    @work_weeks = @schedule.work_weeks
    authorize @schedule
    if request.path != schedule_path(@schedule)
      redirect_to @schedule, status: :moved_permanently
    end
  end

  def edit
    @schedule = Schedule.friendly.find(params[:id])
    @locations = current_user.locations
    authorize @schedule
  end

  def destroy
    @schedule = Schedule.find_by_id(params[:id])
    authorize @schedule
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_path }
      format.js
    end
  end

  def set_schedule_dates
    set_start_date
    set_end_date
  end

  def set_start_date
    start_date = params["schedule"]["start_date"]
    if start_date.present?
      date_ary = start_date.split(" - ")
      params["schedule"]["start_date"] =
        "#{date_ary[0]}/#{date_ary[1]}/#{date_ary[2]}".to_date
    end
  end

  def set_end_date
    end_date = params["schedule"]["end_date"]
    if end_date.present?
      date_ary = end_date.split(" - ")
      params["schedule"]["end_date"] =
        "#{date_ary[0]}/#{date_ary[1]}/#{date_ary[2]}".to_date
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(
      :name, :start_date, :end_date, :user_id, :location_id
    )
  end
end
