class HomeController < ApplicationController
  def index
    @posts = Post.all
  end

  def search
    @items = Item.where(products_name: params[:search])
  end

  def keyword
    @items = Item.search(params[:search])
  end
end
