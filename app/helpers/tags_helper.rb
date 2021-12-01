module TagsHelper
  
  def get_checked(book)
    book.tags.pluck(:id).include?(@tag.id)
  end
end
