class RemovePostimageFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :post_image, :string
  end
end
