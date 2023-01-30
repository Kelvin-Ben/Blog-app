class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes, counter_cache: true
  has_many :comments, foreign_key: :post_id

  after_save :update_posts_counter
  validates :title, presence: true
  validates :title, length: { maximum: 250, too_long: 'Name must not exceed 250 characters' }
  validates_numericality_of :comments_counter, greater_than_or_equal_to: 0, message:
    'Comments counter must be an integer greater than or eaqual to zero'
  validates_numericality_of :likes_counter, greater_than_or_equal_to: 0, message:
    'Likes counter must be an integer greater than or equal to zero'
  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
