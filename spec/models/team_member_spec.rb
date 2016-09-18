require "rails_helper"

RSpec.describe TeamMember, :type => :model do
  describe "on creation" do
    it "raises error without first name" do
      team_member = TeamMember.new(user_id: 1, last_name: "last name")
      expect(team_member.valid?).to be false
    end

    it "raises error without last name" do
      team_member = TeamMember.new(user_id: 1, first_name: "first name")
      expect(team_member.valid?).to be false
    end

    it "is not valid without a user" do
      team_member = TeamMember.new(first_name: "first", last_name: "last")
      expect(team_member.valid?).to be false
    end
  end
end