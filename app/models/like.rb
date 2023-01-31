class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id

  after_save :update_post_likes_count

  def update_post_likes_count
    post.increment!(:likes_counter)
  end
end
