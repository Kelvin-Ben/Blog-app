class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes
  has_many :comments, foreign_key: :post_id

  validates_presence_of :title, message: "Title cannot be Blank!"
  validates :title, length: { maximum: 250, too_long: "Name must not exceed 250 characters"}
  validates_numericality_of :comments_count, greater_than_or_equal_to: 0, message: 
    "Comments counter must be an integer greater than or eaqual to zero"
  validates_numericality_of :likes_count, greater_than_or_equal_to: 0, message:
    "Likes counter must be an integer greater than or equal to zero"
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_comments_counter
    update(comments_count: comments.count)
  end

  def update_likes_counter
    update(likes_count: likes.count)
  end
end
