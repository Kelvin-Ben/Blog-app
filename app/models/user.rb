class User < ApplicationRecord
  has_many :posts
  has_many :comments, through: :posts
  has_many :likes, through: :posts

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def increment_posts_counter
    increment!(:posts_count)
  end
end
