class ItemsController < ApplicationController
  def index
    @posts = Post.all
    @user = current_user
    @items = @user.items
    # @userの子であるitemに限定する
  end

  def new
    @post = Post.find_by(id: params[:id])
    @item = Item.new(item_image: params[:item_image],
                     brand: params[:brand],
                     size: params[:size],
                     price: params[:price],
                     products_name: params[:products_name],
                     post_id: params[:post_id])
  end

  def create
    @item = Item.new(item_image: params[:item_image],
                     brand: params[:brand],
                     size: params[:size],
                     price: params[:price],
                     products_name: params[:products_name],
                     post_id: params[:post_id])
    @item.user_id = current_user.id
    if @item.save
      @item.item_image = "#{@item.id}.jpg"
      image = params[:item_image]
      File.binwrite("app/assets/images/items/#{@item.item_image}", image.read)
      redirect_to("/items/#{@item.post_id}/show")
    else
      render('/items/new')
    end
  end

  def show
    @item = Item.find_by(params[:id])
    @post = Post.find_by(id: params[:id])
    @items = @post.items
  end

  def edit
    @item = Item.find_by(params[:id])
  end

  def update
    @item = Item.find_by(params[:id])
    @item.products_name = params[:products_name]
    @item.brand = params[:brand]
    @item.size = params[:size]
    @item.price = params[:price]
    @item.item_image = "#{@item.id}.jpg"
    image = params[:item_image]
    File.binwrite("app/assets/images/items/#{@item.item_image}", image.read)
    if @item.save
      redirect_to("/posts/#{@item.post.id}")
    else
      render("items/#{@item.post.id}/edit")
    end
  end

  def destroy
    @item = Item.find_by(params[:post_id])
    @item.destroy
    redirect_to("/posts/#{@item.post.id}")
  end
end
