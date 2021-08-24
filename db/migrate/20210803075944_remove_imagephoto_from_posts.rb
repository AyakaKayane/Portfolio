class RemoveImagephotoFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :image_photo, :string
  end
end
