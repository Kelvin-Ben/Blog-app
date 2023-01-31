require 'rails_helper'

RSpec.describe 'Post show page', type: :system do
  before :all do
    @tom = User.create(name: 'Tom', photo: '#', bio: 'bio1')
    @lilly = User.create(name: 'Lilly', photo: '#', bio: 'bio2')
    @post1 = Post.create(title: 'post1', text: 'text1', author_id: @tom.id)
    @comment1 = Comment.create(text: 'comment1', author_id: @lilly.id, post_id: @post1.id)
    @comment2 = Comment.create(text: 'comment2', author_id: @lilly.id, post_id: @post1.id)
    @comment3 = Comment.create(text: 'comment3', author_id: @lilly.id, post_id: @post1.id)
    @comment4 = Comment.create(text: 'comment4', author_id: @lilly.id, post_id: @post1.id)
    @comment5 = Comment.create(text: 'comment5', author_id: @lilly.id, post_id: @post1.id)
    @comment6 = Comment.create(text: 'comment6', author_id: @lilly.id, post_id: @post1.id)
    @like1 = Like.create(author_id: @lilly.id, post_id: @post1.id)
  end

  it 'displays the post\'s title' do
    visit user_post_path(@tom, @post1)
    expect(page).to have_content('post1')
  end

  it 'displays who wrote the post' do
    visit user_post_path(@tom, @post1)
    expect(page).to have_content('Tom')
  end

  it 'displays how many commnets the post has' do
    visit user_post_path(@tom, @post1)
    expect(page).to have_content('Comments: 6')
  end

  it 'displays how many likes the post has' do
    visit user_post_path(@tom, @post1)
    expect(page).to have_content('Likes: 1')
  end

  it 'displays the post\'s body' do
    visit user_post_path(@tom, @post1)
    expect(page).to have_content('text1')
  end

  it 'displays all the comments each commenter left and their username' do
    visit user_post_path(@tom, @post1)
    expect(page).to have_content('Lilly: comment1')
    expect(page).to have_content('Lilly: comment2')
    expect(page).to have_content('Lilly: comment3')
    expect(page).to have_content('Lilly: comment4')
    expect(page).to have_content('Lilly: comment5')
    expect(page).to have_content('Lilly: comment6')
  end
end