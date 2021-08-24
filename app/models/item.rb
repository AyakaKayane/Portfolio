class Item < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true

  def self.search(search)
    if search
      Item.where(['product_name LIKE ? OR brand LIKE ?', "%#{search}%", "%#{search}%"])
    else
      Item.all
    end
  end
end
