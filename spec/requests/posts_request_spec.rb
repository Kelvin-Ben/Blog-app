require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  # Checking if response status was correct
  describe 'GET /posts/:id' do
    it 'returns a 200 status code' do
      get user_path(:user)
      expect(response).to have_http_status(200)
    end
  end

  # If a correct template was rendered
  describe 'GET /posts/:id' do
    it 'renders the show template' do
      get user_path(:user)
      expect(response).to render_template(:show)
    end
  end

  # If the response body includes correct placeholder text
  describe 'GET /post/:id' do
    it 'If the response body includes correct placeholder text' do
      get user_path(:user)
      expect(response.body).to include('Welcome to the users page')
    end
  end
end
