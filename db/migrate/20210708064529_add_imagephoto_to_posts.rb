class AddImagephotoToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :image_photo, :string
  end
end
