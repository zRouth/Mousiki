require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:spotify]
  end

  describe '#new' do
    it 'should successfully direct to auth path' do
      get :new, provider: :spotify
      expect(response).to redirect_to 'http://test.host/auth/spotify'
    end
  end
  describe '#create' do
    it 'should successfully create a user' do
      expect do
        post :create, provider: :spotify
      end.to change { User.count }.by(1)
    end

    it 'should successfully create a session' do
      expect(session[:user_id]).to be_nil
      post :create, provider: :spotify
      expect(session[:user_id]).to_not be_nil
    end
  end

  describe '#destroy' do
    before do
      post :create, provider: :spotify
    end

    it 'should clear the session' do
      expect(session[:user_id]).to_not be_nil
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    it 'should redirect to the home page' do
      delete :destroy
      expect(response).to redirect_to root_url
    end
  end
end
