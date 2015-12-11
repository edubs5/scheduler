require "rails_helper"

RSpec.describe User, :type => :model do
  describe "when looking for a user" do
    before(:example) do
      @auth = {
        "provider": "auth_provider",
        "uid":      "00001",
        "info": {
          "name":       "Hello World",
          "email":      "hello_world@example.com",
          "first_name": "Hello",
          "last_name":  "World"
        }
      }
    end

    describe ".from_omniauth" do
      it "returns a user" do
        user = User.from_omniauth(@auth)
        expect(user).to_not be nil
      end
    end

    describe ".create_from_omniauth" do
      it "creates a user" do
        expect{ User.create_from_omniauth(@auth) }
          .to change{ User.count }
          .by 1
      end
    end
  end
end