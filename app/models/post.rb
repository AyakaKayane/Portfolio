class Post < ApplicationRecord
  belongs_to :user
  has_many :items, inverse_of: :post, dependent: :destroy
  has_many :likes

  validates :user_id, {presence: true}

  #mount_uploader :image, ImageUploader

  #投稿情報とユーザ情報を紐付ける
  def user
    return User.find_by(id: self.user_id)
  end
end
