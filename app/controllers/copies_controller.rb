class CopiesController < ApplicationController
  def index
  end

  def add
    @book = Copy.new(copy_params)
  end

  def edit

  end

  def remove

  end

end
