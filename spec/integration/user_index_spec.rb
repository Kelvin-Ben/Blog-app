require 'rails_helper'

RSpec.describe 'Home page', type: :system do
  before :all do
    @thomas = User.create(name: 'Thomas', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @lilly = User.create(name: 'Lilly', photo: '#', bio: 'Teacher from Poland')
    @linktester = User.create(name: 'Linktester', photo: '#', bio: 'Teacher from Poland')
    @post1 = Post.create(title: 'post1', text: 'text1', author_id: @thomas.id)
    @post2 = Post.create(title: 'post2', text: 'text2', author_id: @thomas.id)
    @post3 = Post.create(title: 'post3', text: 'text1', author_id: @thomas.id)
    @post4 = Post.create(title: 'post4', text: 'text2', author_id: @thomas.id)
    @post5 = Post.create(title: 'post5', text: 'text3', author_id: @lilly.id)
  end

    it 'shows the right username' do
      visit users_path
      expect(page).to have_content('Thomas')
      expect(page).to have_content('Lilly')
    end

    it 'should see profile pictures' do
      visit users_path
      expect(page).to have_css("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'should see the number of posts for each user' do
      visit users_path
      expect(page).to have_content('Number of posts: 0')
    end

    it 'redirects to user show page' do
      visit users_path
      click_link('Linktester')
      expect(page).to have_current_path(user_path(@linktester.id))
    end
end