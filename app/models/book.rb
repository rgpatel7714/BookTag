class Book < ApplicationRecord
  has_many :assign_book_tags
  has_many :tags, through: :assign_book_tags
end
