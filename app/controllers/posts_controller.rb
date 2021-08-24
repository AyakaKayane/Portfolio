class PostsController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  before_action :authenticate_user, only:[:show]

  def index
    @user = current_user
    @posts = @user.posts
    @items = Item.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    @items = @post.items
    #投稿に紐付くユーザ情報を取得する(Postモデルで定義した関数)
    @user = @post.user
    
  end

  def new
    @post = Post.new
  end


  def create
    @post = Post.new(image: params[:image], image_title: params[:image_title], description: params[:description])
    @post.user_id="#{current_user.id}"
    if @post.save
      #@post.image="#{@post.id}.jpg"
      @post.image="#{@post.id}.jpg"
      image=params[:image]
      File.binwrite("app/assets/images/posts/#{@post.image}", image.read)
      redirect_to("/posts/#{@post.id}")
    else
      render("/posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.image_title = params[:image_title]
    @post.description = params[:description]
    @post.image="#{@post.id}.jpg"
    image = params[:image]
    File.binwrite("app/assets/images/posts/#{@post.image}", image.read)
    if @post.save
      redirect_to("/posts/#{@post.id}")
    else
      render("posts/#{@post.id}/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

end
