class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes
  has_many :comments, foreign_key: :post_id

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_comments_counter
    self.update(comments_count: self.comments.count)
  end

  def update_likes_counter
    self.update(likes_count: self.likes.count)
  end
end

# first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
# second_post = Post.create(author: second_user, title: 'Hey', text: 'This is my second post')
# third_post = Post.create(author: first_user, title: 'Hello world', text: 'This is my first page')
# fourth_post = Post.create(author: second_user, title: 'I am a developer', text: 'I love what I do')
# fifth_post = Post.create(author: first_user, title: 'I like this post', text: 'It was amazing to read it')
# sixth_post = Post.create(author: second_user, title: 'How amazing?', text: 'How do I become a writer too?')
# seventh_post = Post.create(author: first_user, title: 'The reading is Great', text: 'I enjoyed the article')
# eighth_post = Post.create(author: second_user, title: 'How cool is it?', text: 'One of amzing reading in my life!')

# Comment.create(post: third_post, author: first_user, text: 'Hi Tom!')
# Comment.create(post: third_post, author: first_user,  text: 'Hello Ken')
# Comment.create(post: third_post, author: second_user, text: 'How are you?')
# Comment.create(post: third_post, author: first_user,  text: 'Which article to read again?')
# Comment.create(post: third_post, author: second_user, text: 'I am happy for you')
# Comment.create(post: third_post, author: first_user,  text: 'Nice to third_post
