require "rails_helper"

RSpec.describe User, :type => :model do
  describe "when looking for a user" do
    before(:example) do
      @mock_auth = OmniAuth.config.mock_auth[:google_oauth2]
    end

    describe ".from_omniauth" do
      it "returns a user" do
        user = User.from_omniauth(@mock_auth)
        expect(user).to_not be nil
      end
    end

    describe ".create_from_omniauth" do
      it "creates a user" do
        expect{ User.create_from_omniauth(@mock_auth) }
          .to change{ User.count }
          .by 1
      end
    end
  end
end