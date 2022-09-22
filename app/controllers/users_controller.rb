class UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
    @users = User.all
  end

  def show
    @user = User.find(current_user_params[:id])
    @book = Book.new
    @books = current_user.books.all
  end

  def edit
    @user = User.find(current_user_params:id)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
