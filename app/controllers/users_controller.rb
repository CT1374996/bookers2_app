class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def mypage
    redirect_to user_path(current_user)
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to @user_path
    end
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to @user_path
    end
    @user = User.find(params[:id])
    @user.update
    redirect_to user_path(@user.id)
  end
end
