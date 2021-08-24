class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :products_name
      t.text :brand
      t.integer :price
      t.string :size

      t.timestamps
    end
  end
end
