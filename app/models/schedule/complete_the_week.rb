# ensure week array account for all seven days of the week
class Schedule
  class CompleteTheWeek
    WEEK_DAYS = {
      "Sunday": "28/2/2016".to_date,
      "Monday": "29/2/2016".to_date,
      "Tuesday": "1/3/2016".to_date,
      "Wednesday": "2/3/2016".to_date,
      "Thursday": "3/3/2016".to_date,
      "Friday": "4/3/2016".to_date,
      "Saturday": "5/3/2016".to_date
    }

    DAYS = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday",
            "Friday", "Saturday"]

    def initialize(week)
      @week = week
    end

    def complete_the_week
      not_a_full_week? ? complete_week : @week
    end

    def not_a_full_week?
      @week.length != 7
    end

    def complete_week
      missing_days.each do |day|
        missing_day = Workday.new(work_date: WEEK_DAYS[day.to_sym],
                                  schedule_id: -1)
        @week << missing_day
      end
      order_week_by_week_day
    end

    def order_week_by_week_day
      order = []
      DAYS.each do |day|
        @week.each do |date|
          if date.week_day == day
            order << date
            @week.delete_if { |current_day| current_day.week_day == date }
          end
        end
      end
      order
    end

    def missing_days
      current_days = []
      @week.each { |day| current_days << day.week_day }
      DAYS - current_days
    end
  end
end
