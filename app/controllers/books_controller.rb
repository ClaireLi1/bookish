class BooksController < ApplicationController
  def index
    @books = Book.order(:title)
  end

  def new
    @book = Book.new
  end

  def show

  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: 'Book was successfully created.'
    else
      flash.now[:alert] = @book.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])

  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to 'books#index', notice: 'Book was successfully updated.'
    else
      flash.now[:alert] = @book.errors.full_messages.to_sentence
      render :edit
    end

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully destroyed.'
  end


  private

  def book_params
    params.require(:book).permit(:title, :author, :isbn)
  end


end
