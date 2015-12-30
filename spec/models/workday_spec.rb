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
      expect(@workday.week_of_year).to eq "52"
    end
  end
end