require "rails_helper"

RSpec.describe Workday, type: :model do
  before(:example) do
    @workday = Workday.new(schedule_id: 1, work_date: "11/12/2015".to_datetime)
  end

  describe "#day_of_the_week" do
    it "returns Friday for Dec 11, 2015" do
      expect(@workday.day_of_the_week).to eq "Friday"
    end
  end

  describe "#week_of_year" do
    it "returns 52 for Dec 30, 2015" do
      @dec30 = Workday.new(
        schedule_id: 1,
        work_date: "30/12/2015".to_datetime
      )
      expect(@dec30.week_of_year).to eq "52"
    end
  end

  describe "#beginning_of_week_starting_sunday" do
    context "returns sunday as beginning of week" do
      it "returns Sun Dec 20, 2015 given Sat Dec 26, 2015" do
        @saturday = Workday.new(
          schedule_id: 1,
          work_date: "26/12/2015".to_datetime
        )
        expect(@saturday.beginning_of_week_starting_sunday).
          to eq "20/12/2015".to_date
      end
    end
  end
end
