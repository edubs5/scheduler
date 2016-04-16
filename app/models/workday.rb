class Workday < ActiveRecord::Base
  belongs_to :schedule

  def week_day
    work_date.strftime("%A")
  end
end
