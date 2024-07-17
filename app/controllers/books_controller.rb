class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new

  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(params)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])

  end
  def update
    @book = Book.find(params[:id])
    @book.update(params)

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
  end

end
