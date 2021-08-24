class RemoveItemFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :item_image, :string
  end
end
