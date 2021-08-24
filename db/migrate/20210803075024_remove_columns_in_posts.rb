class RemoveColumnsInPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :products_name, :text
    remove_column :posts, :brand, :text
    remove_column :posts, :price, :integer
    remove_column :posts, :size, :string
  end
end
