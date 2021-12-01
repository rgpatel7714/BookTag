class BookTagMailsMailer < ApplicationMailer
  def send_mail
    @books = Book.all
    @book_hash = {};
    @books.each do |book|
      @book_hash[book] = book.tags.count
    end
    @final_hash = Hash[@book_hash.sort_by{|k, v| v}]
    @max_tag_books = @final_hash.to_a.last(3)
    mail(to: "rgpatel7714@gmail.com", subject: "Books with highest tags")
  end
end
