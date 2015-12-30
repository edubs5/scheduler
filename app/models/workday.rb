class Workday < ActiveRecord::Base
  belongs_to :schedule

  def day_of_the_week
    work_date.strftime("%A")
  end

  def month_of_year
    work_date.strftime("%W")
  end
end
