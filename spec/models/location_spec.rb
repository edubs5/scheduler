require "rails_helper"

RSpec.describe Location, :type => :model do
  describe "on creation" do
    it "raises error if name is blank" do
      location = Location.new(user_id: 1)
      expect(location.valid?).to be false
    end

    it "is not valid without a user" do
      location = Location.new(name: "the city")
      expect(location.valid?).to be false
    end
  end
end