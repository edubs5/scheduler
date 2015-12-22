require "rails_helper"

RSpec.describe Schedule, type: :model do
  describe "on create" do
    it "raises error if there is no user" do
      schedule = Schedule.new(name: "new schedule", start_date: Date.today,
        end_date: Date.today + 1.week)
      expect(schedule.valid?).to be false
    end

    it "raises error if there is no name" do
      schedule = Schedule.new(user_id: 1, start_date: Date.today,
        end_date: Date.today + 1.week)
      expect(schedule.valid?).to be false
    end

    it "raises error if there is no start_date" do
      schedule = Schedule.new(user_id: 1, end_date: Date.today, name: "test")
      expect(schedule.valid?).to be false
    end

    it "raises error if there is no end_date" do
      schedule = Schedule.new(user_id: 1, start_date: Date.today, name: "test")
      expect(schedule.valid?).to be false
    end
  end
end