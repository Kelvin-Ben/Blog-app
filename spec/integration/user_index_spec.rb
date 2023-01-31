require 'rails_helper'

RSpec.describe 'Home page', type: :system do
  before :all do
    @thomas = User.create(name: 'Thomas', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @lilly = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BHHuVvo', bio: 'Teacher from Poland')
    @post1 = Post.create(title: 'post1', text: 'text1', author_id: @thomas.id)
    @post2 = Post.create(title: 'post2', text: 'text2', author_id: @thomas.id)
    @post3 = Post.create(title: 'post3', text: 'text1', author_id: @thomas.id)
    @post4 = Post.create(title: 'post4', text: 'text2', author_id: @thomas.id)
    @post5 = Post.create(title: 'post5', text: 'text3', author_id: @lilly.id)
  end
  describe 'index page' do
    it 'shows the right username' do
      visit root_path
      expect(page).to have_content('Thomas')
      expect(page).to have_content('Lilly')
    end

    it 'should see profile pictures' do
      visit root_path
      expect(page).to have_xpath("//img[contains(@src,'https://unsplash.com/photos/F_-0BxGuVvo')]")
    end

    it 'should see the number of posts for each user' do
      visit root_path
      expect(page).to have_content('Number of posts: 4')
    end

    it 'redirects to user show page' do
      visit root_path
      click_link('Thomas')
      expect(page).to have_current_path(user_path(@thomas.id))
    end
  end
end