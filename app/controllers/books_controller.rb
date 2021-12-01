class BooksController < ApplicationController
  
  def index
    @books = Book.all
  end

  def filter_books
    @books = [];

    @books = Book.all if !params["filter_tag"].present? && !params["filter_price"].present?
    get_book if params["filter_tag"].present? && params["filter_price"].present?
    get_book_price if !params["filter_tag"].present? && params["filter_price"].present?
    get_book_tag if params["filter_tag"].present? && !params["filter_price"].present?
   
    render 'index'
  end

  def get_book_price
    price = params["filter_price"].split("-")
    @selected_price = [params["filter_price"],params["filter_price"]]
    @books = Book.where('price BETWEEN ? AND ?',price[0].to_i,price[1].to_i)
  end

  def get_book_tag
    @tags = Tag.where(name: params["filter_tag"])

    @selected_tags = params["filter_tag"]
    @tags.each do |tag|
      @books = @books + tag.books
    end
    @books = @books.uniq
  end

  def get_book
    @books_tag = [];
    @tags = Tag.where(name: params["filter_tag"])
    @selected_tags = params["filter_tag"]
    @tags.each do |tag|
      @books_tag = @books_tag + tag.books
    end

    price = params["filter_price"].split("-")
    @selected_price = [params["filter_price"],params["filter_price"]]
    @books_price = Book.where('price BETWEEN ? AND ?',price[0].to_i,price[1].to_i)
    
    @books = @books_price & @books_tag.uniq
  end
end
