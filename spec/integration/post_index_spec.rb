require 'rails_helper'

RSpec.describe 'Post index view', type: :system do
  before :all do
    @tom = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico')
    @lilly = User.create(name: 'Lilly', photo: '#', bio: 'Teacher from Poland')
    @post1 = Post.create(title: 'post1', text: 'text1', author_id: @tom.id)
    @post2 = Post.create(title: 'post2', text: 'text2', author_id: @tom.id)
    @post3 = Post.create(title: 'post3', text: 'text3', author_id: @tom.id)
    @post4 = Post.create(title: 'post4', text: 'text4', author_id: @tom.id)
    @post5 = Post.create(title: 'post5', text: 'text5', author_id: @lilly.id)
    @comment1 = Comment.create(text: 'comment1', author_id: @lilly.id, post_id: @post1.id)
    @comment2 = Comment.create(text: 'comment2', author_id: @lilly.id, post_id: @post1.id)
    @comment3 = Comment.create(text: 'comment3', author_id: @lilly.id, post_id: @post1.id)
    @comment4 = Comment.create(text: 'comment4', author_id: @lilly.id, post_id: @post1.id)
    @comment5 = Comment.create(text: 'comment5', author_id: @lilly.id, post_id: @post1.id)
    @comment6 = Comment.create(text: 'comment6', author_id: @lilly.id, post_id: @post1.id)
  end
  it 'shows the profile picture of the user' do
    visit user_posts_path(@tom)
    expect(page).to have_css("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  it 'shows the user\'s name' do
    visit user_posts_path(@tom)
    expect(page).to have_content('Tom')
  end

  it 'displays the number of posts for the user' do
    visit user_posts_path(@tom)
    expect(page).to have_content('Number of posts: 4')
  end

  it 'displays post title' do
    visit user_posts_path(@tom)
    expect(page).to have_content('post1')
  end

  it 'displays post body' do
    visit user_posts_path(@tom)
    expect(page).to have_content('text1')
  end

  it 'displays the last 5 comments' do
    visit user_posts_path(@tom)
    expect(page).to have_content('Lilly : comment2')
    expect(page).to have_content('Lilly : comment3')
    expect(page).to have_content('Lilly : comment4')
    expect(page).to have_content('Lilly : comment5')
    expect(page).to have_content('Lilly : comment6')
  end

  it 'displays the number of comments a post has' do
    visit user_posts_path(@tom)
    expect(page).to have_content('Comments: 6')
  end

  it 'displays the number of likes a post has' do
    visit user_posts_path(@tom)
    expect(page).to have_content('Likes: 0')
  end

  it 'redirects to the show page of a specific post' do
    visit user_posts_path(@tom)
    click_link('post1')
    expect(page).to have_current_path(user_post_path(@tom, @post1))
  end
end