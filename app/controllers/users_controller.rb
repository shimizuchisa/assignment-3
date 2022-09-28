class UsersController < ApplicationController
  def index
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
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "You have updated user successfully."
    else
      #@user = User.find(params[:id])
      render 'edit'
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
