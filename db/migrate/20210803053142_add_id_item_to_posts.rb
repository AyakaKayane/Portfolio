class AddIdItemToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :item_id, :integer
  end
end
