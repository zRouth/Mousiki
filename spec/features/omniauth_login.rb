require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'omniauth login', type: :feature do
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:spotify]
  end
end
