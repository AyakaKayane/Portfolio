class RegisterItemForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  #ゲッターとセッターを定義してくれるメソッド。与えられた引数をもとに属性を設定し、これを取得するメソッド（ゲッター）と更新するメソッド（セッター）を定義することができる。
  #モデルに対応するテーブルのカラム名以外の属性を扱いたい場合は、attr_accessorを用いて追加する。
  attr_accessor :description, :image_title, :image, :item_image, :brand, :price, :size, :products_name, :user_id, :post_id

  #ヴァリデーション
  #presence: trueにより、user_idが空欄だと、エラーになるということ
  validates :user_id, {presence: true}

  def save
    #ヴァリデーションが通らないときにfalseを返す
    return false unless valid?

    #コーディネート登録
    post = Post.new
    post.save
    
    #アイテム登録
    item = post.items.build
    item.save

    
  end

end
