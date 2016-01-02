class Workday < ActiveRecord::Base
  belongs_to :schedule

  def day_of_the_week
    work_date.strftime("%A")
  end

  def week_of_year
    work_date.strftime("%W")
  end

  def beginning_of_week_starting_sunday
    work_date.beginning_of_week(start_day = :sunday)
  end
end
