require "rails_helper"

RSpec.describe UsersController, :type => :controller do
  describe "#create" do
    before(:example) do
      @user_params = OmniAuth.config.mock_auth[:google_oauth2]
    end

    context "when it is a new user" do
      it "creates a user" do
        expect{ post :create, user: @user_params }
          .to change{ User.count }
          .by 1
      end
    end
  end
end