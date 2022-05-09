class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:create] = "Book was successfully created."
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path
      flash[:edit] = "Book was successfully updated."
    else
      redirect_to edit_book_path
      flash[:error] = "Book wasn't successfully updated.error"
    end
  end

  def destroy
    book = Book.find(params[:id])
    if  book.destroy
      redirect_to books_path
      flash[:notice] = "Book was successfully destroyed."
    else
      flash[:alert] = "Book wasn't successefully destroyed."
    end
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
