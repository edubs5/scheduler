require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  before(:example) do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  describe '#create' do
    it 'create user' do
      User.delete_all
      expect{ post :create, provider: :google_oauth2 }
        .to change{ User.count }
        .by 1
    end

    it 'creates a session' do
      post :create, provider: :google_oauth2
      expect(session[:user_id]).to_not be nil
    end

    it 'redirects to root_url' do
      post :create, provider: :google_oauth2
      expect(response).to redirect_to(schedules_path)
    end
  end

  describe '#destroy' do
    before(:example) do
      post :create, provider: :google_oauth2
    end

    it 'destroys session' do
      delete :destroy
      expect(session[:user_id]).to be nil
    end

    it 'redirects to root_url' do
      delete :destroy
      expect(response).to redirect_to(root_url)
    end
  end
end