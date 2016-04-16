require "rails_helper"

RSpec.describe Workday, type: :model do
  before(:example) do
    @workday = Workday.new(schedule_id: 1, work_date: "11/12/2015".to_datetime)
  end

  describe "#week_day" do
    it "returns Friday for Dec 11, 2015" do
      expect(@workday.week_day).to eq "Friday"
    end
  end
end
