class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, through: :posts
  has_many :likes, through: :posts

  validates :name, presence: true
  validates_numericality_of :posts_counter, greater_than_or_equal_to: 0, message:
    'posts counter must be an integer greater_than_or_equal_to zero'

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
