class Comment < ApplicationRecord
  belongs_to :user, index: true, foreign_key: true
  belongs_to :post, index: true, foreign_key: true
end
