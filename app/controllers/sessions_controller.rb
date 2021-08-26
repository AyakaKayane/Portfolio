class SessionsController < ApplicationController
  wrap_parameters :user, include: [:name, :password]
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to('/')
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to('/')
  end

  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
