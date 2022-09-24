class UsersController < ApplicationController
  def index
    # @user = User.find(params[:id])
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    #@user.booksで、@user(showの1行目)の投稿を取得
  end

  def edit
    @user = User.find(current_user_params:id)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
