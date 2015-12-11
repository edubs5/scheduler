require "rails_helper"

RSpec.describe UsersController, :type => :controller do
  describe "#create" do
    before(:example) do
      @user_params = {
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

    it "create user" do
      expect{ post :create, user: @user_params }
        .to change{ User.count }
        .by 1
    end
  end
end