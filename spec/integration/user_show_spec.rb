require 'rails_helper'

RSpec.describe 'User show view', type: :system do
  before :each do
    @tom = User.create(name: 'tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico')
    @lilly = User.create(name: 'lilly', photo: 'https://unsplash.com/photos/F_-0BGVvo', bio: 'Teacher from Poland')
    @post1 = Post.create(title: 'post1', text: 'text1', author_id: @tom.id)
    @post2 = Post.create(title: 'post2', text: 'text2', author_id: @tom.id)
    @post3 = Post.create(title: 'post3', text: 'text3', author_id: @tom.id)
    @post4 = Post.create(title: 'post4', text: 'text4', author_id: @tom.id)
    @post5 = Post.create(title: 'post5', text: 'text5', author_id: @lilly.id)
  end
  describe 'show users' do
    it 'shows the profile picture of the user' do
      visit user_path(@tom.id)
      expect(page).to have_css("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'shows the user\'s name' do
      visit user_path(@tom.id)
      expect(page).to have_content('tom')
    end

    it 'displays the number of posts for the user' do
      visit user_path(@tom.id)
      expect(page).to have_content('Number of posts: 4')
    end

    it 'displays user bio' do
      visit user_path(@tom.id)
      expect(page).to have_content('Teacher from Mexico')
    end

    it 'displays recent 3 posts' do
      visit user_path(@tom.id)
      expect(page).not_to have_content('post1')
      expect(page).to have_content('post2')
      expect(page).to have_content('post3')
      expect(page).to have_content('post4')
    end

    it 'has a button to show all posts' do
      visit user_path(@tom.id)
      expect(page).to have_content('see all posts')
    end

    it 'redirects to specific post page' do
      visit user_path(@tom.id)
      click_link 'post2'
      expect(page).to have_current_path(user_post_path(@tom.id, @post2.id))
    end

    it 'redirects to user post index page' do
      visit user_path(@tom.id)
      click_link 'see all posts'
      expect(page).to have_current_path(user_posts_path(@tom.id))
    end
  end
end