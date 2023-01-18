class AddPostsRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post, foreign_key: true, null: false
  end
end
