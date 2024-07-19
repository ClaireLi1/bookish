class CopiesController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_copy, only: [:show, :edit, :update, :destroy, :borrow, :return]
  before_action :admin_only, only: [:new, :create, :edit, :update, :destroy]
  def index
    @book = Book.find(params[:book_id])
    @copies = @book.copies
  end

  def show

  end

  def new
    @book = Book.find(params[:book_id])
    @copy = @book.copies.new
  end

  def create
    @book = Book.find(params[:book_id])
    @copy = @book.copies.new(copy_params)
    if @copy.save
      redirect_to book_copies_path(@book)
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:book_id])
    @copy = @book.copies.find(params[:id])
  end

  def update
    @book = Book.find(params[:book_id])
    @copy = @book.copies.find(params[:id])
    if @copy.update(copy_params)
      redirect_to book_copies_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @copy = @book.copies.find(params[:id])
    @copy.destroy
    redirect_to book_copies_path(@book), notice: 'Copy was successfully destroyed.'
  end


  def borrow
    @book = Book.find(params[:book_id])
    @copy = @book.copies.find(params[:id])
    if @copy.available?
      @copy.update(borrower_id: current_user.id, borrower: current_user, due_date: 2.weeks.from_now, available: false)
      redirect_to dashboard_path, notice: 'Book was successfully borrowed.'
    else
      redirect_to book_copies_path(@book), alert: 'This book copy is currently unavailable.'
    end
  end

  def return
    @book = Book.find(params[:book_id])
    @copy = @book.copies.find(params[:id])
    if @copy.borrower == current_user.email
      @copy.update(borrower: nil, due_date:nil, borrower_id: nil, available: true)
      redirect_to dashboard_path, notice: 'Book was successfully returned.'
    else
      redirect_to book_copies_path(@book), alert: 'Unable to return this book copy.'
    end
  end

  private
  def admin_only
    redirect_to(root_path, alert: 'Not authorized') unless current_user.admin?
  end

  def copy_params
    params.require(:copy).permit(:borrower, :due_date, :available)
  end

end
