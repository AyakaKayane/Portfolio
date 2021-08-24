class HomeController < ApplicationController
  def index
    @posts = Post.all
  end

  def search
    #Viewで入力された(params[:search]をRoomの列からwhereメソッドを使い探し＠travelへ代入
    @items = Item.where(products_name: params[:search])
  end

  def keyword
    #Viewで入力された(params[:search]をRoomの列からsearchメソッドを使い探し＠travelへ代入
    @items = Item.search(params[:search])
  end

end
