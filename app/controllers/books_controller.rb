#Bookers2
class BooksController < ApplicationController

  def index
    @newbook = Book.new
    @books = Book.all
  end

  def create
    @newbook = Book.new(book_params)
    #カラムにuser_idを追加しているので、下記が必要
    @newbook.user_id = current_user.id
    if @newbook.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@newbook.id)
    else
      @books = Book.all
      render :index
    end
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
    unless @book.user == current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:notice] = "You have updated book successfully."
    else
      @book.title = params[:title]
      @book.body = params[:body]
      render 'edit'
    end
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