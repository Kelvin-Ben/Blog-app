require 'rails_helper'

RSpec.describe 'Home page', type: :system do
  before :all do
    @Tom = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @Lilly = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BHHuVvo', bio: 'Teacher from Poland')
    @post1 = Post.create(title: 'post1', text: 'text1', author_id: @Tom.id)
    @post2 = Post.create(title: 'post2', text: 'text2', author_id: @Tom.id)
    @post3 = Post.create(title: 'post3', text: 'text3', author_id: @Lilly.id)
  end
  describe 'index page' do
    it 'shows the right username' do
      visit root_path
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
    end

    it 'should see profile pictures' do
      visit root_path
      expect(page).to have_xpath("//img[contains(@src,'https://unsplash.com/photos/F_-0BxGuVvo')]")
      expect(page).to have_xpath("//img[contains(@src,'https://unsplash.com/photos/F_-0BHHuVvo')]")
    end

    it 'should see the number of posts for each user' do
      visit root_path
      users.each do |user|
      expect(page).to have_content(user.posts.count)
      end
    end
  end
end