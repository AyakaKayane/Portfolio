class AddItemToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :description, :text
    add_column :posts, :item_image, :string
  end
end
