require "rails_helper"

RSpec.describe SchedulePolicy do
  before(:each) do
    mock_auth = OmniAuth.config.mock_auth[:google_oauth2]
    @user = User.from_omniauth(mock_auth)
    @schedule = build(:schedule, user_id: @user.id)
    @schedule_policy = SchedulePolicy.new(@user, @schedule)
  end

  context "when signed in as user" do
    it "allows create" do
      expect(@schedule_policy.create?).to eq true
    end

    it "allows update" do
      expect(@schedule_policy.update?).to eq true
    end

    it "allows destroy" do
      expect(@schedule_policy.destroy?).to eq true
    end

    it "allows edit" do
      expect(@schedule_policy.edit?).to eq true
    end

    it "allows new" do
      expect(@schedule_policy.new?).to eq true
    end

    it "allows index" do
      expect(@schedule_policy.index?).to eq true
    end

    it "allows show" do
      expect(@schedule_policy.show?).to eq true
    end
  end

  context "when another user tries action on someone else's record" do
    before(:example) do
      @schedule2 = build(:schedule, user_id: @user.id + 1)
      @schedule_policy2 = SchedulePolicy.new(@user, @schedule2)
    end

    it "does not allow create" do
      expect(@schedule_policy2.create?).to eq false
    end

    it "does not allow update" do
      expect(@schedule_policy2.update?).to eq false
    end

    it "does not allow destroy" do
      expect(@schedule_policy2.destroy?).to eq false
    end

    it "does not allow edit" do
      expect(@schedule_policy2.edit?).to eq false
    end

    it "does not allow show" do
      expect(@schedule_policy2.show?).to eq false
    end
  end
end
