class Like < ApplicationRecord
  belongs_to :auhtor, class_name: 'User', index: true, foreign_key: :author_id
  belongs_to :post, index: true, foreign_key: :post_id
end
