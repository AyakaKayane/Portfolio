class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :items
  has_many :likes

  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}

  def posts
    return Post.where(user_id: self.id)
  end

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end
  
end
