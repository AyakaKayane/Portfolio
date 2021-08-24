class AddIdpostToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :post_id, :integer
  end
end
