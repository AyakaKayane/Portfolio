class RemovePostIdFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :post_id, :integer
  end
end
