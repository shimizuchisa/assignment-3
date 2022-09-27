#Bookers2
class BooksController < ApplicationController
  def index
    @newbook = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def create
    @newbook = Book.new(book_params)
    #カラムにuser_idを追加しているので、下記が必要
    @newbook.user_id = current_user.id
    @newbook.save
    redirect_to book_path(@newbook.id)

    # def create
      # current_user.posts.create(create_params)
      # redirect_to :root
    # end

  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @newbook = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end