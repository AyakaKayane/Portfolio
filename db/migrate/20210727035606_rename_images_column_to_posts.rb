class RenameImagesColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :images, :image
  end
end
