require "rails_helper"

RSpec.describe Schedule::CompleteTheWeek do
  before(:example) do
    @sun = create(:workday, work_date: "28/2/2016".to_date)
    @mon = create(:workday, work_date: "29/2/2016".to_date)
    @tue = create(:workday)
    @wed = create(:workday, work_date: "2/3/2016".to_date)
    @thu = create(:workday, work_date: "3/3/2016".to_date)
    @fri = create(:workday, work_date: "4/3/2016".to_date)
    @sat = create(:workday, work_date: "5/3/2016".to_date)
    @complete_week = [@sun, @mon, @tue, @wed, @thu, @fri, @sat]
  end

  describe "#not_a_full_week?" do
    context "when all seven days are present" do
      it "true" do
        complete_the_week = Schedule::CompleteTheWeek.new(@complete_week)
        expect(complete_the_week.not_a_full_week?).to eq false
      end
    end

    context "when days are missing" do
      it "false" do
        incomplete_week = [@sun, @fri]
        complete_the_week = Schedule::CompleteTheWeek.new(incomplete_week)
        expect(complete_the_week.not_a_full_week?).to eq true
      end
    end
  end

  describe "#missing_days" do
    it "returns array of missing days" do
      incomplete_week = [@sun, @mon, @tue, @wed, @thu]
      complete_the_week = Schedule::CompleteTheWeek.new(incomplete_week)
      expect(complete_the_week.missing_days).to eq (["Friday", "Saturday"])
    end
  end

  describe "#complete_week" do
    it "returns complete week when last part of week is missing" do
      incomplete_week = [@sun, @mon, @tue, @wed, @thu]
      complete_the_week = Schedule::CompleteTheWeek.new(incomplete_week)
      expect(complete_the_week.complete_week.length).to eq 7
    end

    it "returns complete week when first part of week is missing" do
      incomplete_week = [@thu, @fri, @sat]
      complete_the_week = Schedule::CompleteTheWeek.new(incomplete_week)
      expect(complete_the_week.complete_week.length).to eq 7
    end
  end
end
