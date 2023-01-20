class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes
  has_many :comments, foreign_key: :post_id

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
