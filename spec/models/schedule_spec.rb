require "rails_helper"

RSpec.describe Schedule, type: :model do
  before(:each) do
    @today = Time.zone.today
    @user = User.create(
      first_name: "test", last_name: "last", email: "test@email.com")
    @location = Location.create(name: "test location", user_id: @user.id)
  end

  describe "on create" do
    it "raises error if there is no user" do
      schedule = Schedule.new(
        name: "new schedule",
        start_date: @today,
        end_date: @today + 1.week,
        location_id: @location.id
      )
      expect(schedule.valid?).to be false
    end

    it "raises error if there is no name" do
      schedule = Schedule.new(
        user_id: 1,
        start_date: @today,
        end_date: @today + 1.week,
        location_id: @location.id
      )
      expect(schedule.valid?).to be false
    end

    it "raises error if there is no start_date" do
      schedule = Schedule.new(
        user_id: 1,
        end_date: @today,
        name: "test",
        location_id: @location.id
      )
      expect(schedule.valid?).to be false
    end

    it "raises error if there is no end_date" do
      schedule = Schedule.new(
        user_id: 1,
        start_date: @today,
        name: "test",
        location_id: @location.id
      )
      expect(schedule.valid?).to be false
    end

    it "creates seven workdays if date range is Nov 6 to Nov 12" do
      schedule = Schedule.new(
        user_id: 1,
        start_date: "6/11/2015".to_datetime,
        end_date: "12/11/2015".to_datetime,
        name: "test workdays",
        location_id: @location.id
      )
      expect { schedule.save }.to change { Workday.count }.by 7
    end

    it "creates one workday if date range is Nov 6 to Nov 6" do
      schedule = Schedule.new(
        user_id: 1,
        start_date: "6/11/2015".to_datetime,
        end_date: "6/11/2015".to_datetime,
        name: "test workdays again",
        location_id: @location.id
      )
      expect { schedule.save }.to change { Workday.count }.by 1
    end
  end
end
