class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def create
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
