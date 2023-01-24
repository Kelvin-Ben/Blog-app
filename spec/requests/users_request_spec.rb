require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/:id' do
    it 'returns a 200 status code' do
      get user_path(:user)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:id' do
    it 'renders the show template' do
      get user_path(:user)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET /users/:id' do
    it 'If the response body includes correct placeholder text.' do
      get user_path(:user)
      expect(response.body).to include('Welcome to the users page')
    end
  end
end
