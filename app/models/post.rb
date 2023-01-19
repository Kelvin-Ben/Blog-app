class Post < ApplicationRecord
  belongs_to :user, index: true, foreign_key: true
  has_many :likes
  has_many :Comments
end
