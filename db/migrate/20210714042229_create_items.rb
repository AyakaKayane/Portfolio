class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_image
      t.text :brand
      t.string :size
      t.integer :price
      t.text :products_name

      t.timestamps
    end
  end
end
