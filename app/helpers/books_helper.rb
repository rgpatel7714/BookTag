module BooksHelper
  
  def get_tags(book)
    tags = '';
    book.tags.pluck(:name).each do |tag_name|
      tags = tag_name + ' ' +tags;
    end
    return tags
  end
end
