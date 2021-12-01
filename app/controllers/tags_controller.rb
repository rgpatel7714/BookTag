class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def edit
    @tag = Tag.find(params[:id])
    @books = Book.all
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.books.destroy_all
    params[:book_ids].each do |book_id|
      book = Book.find(book_id)
      AssignBookTag.create(book_id: book.id , tag_id: @tag.id)
    end
    flash[:notice] = "Tag added to selectced book successfully"
    redirect_to tags_path
  end
end
