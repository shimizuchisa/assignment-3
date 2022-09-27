class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @users = User.all
    @newbook = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    #@user.booksで、@user(showの1行目)の投稿を取得
    @newbook = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
