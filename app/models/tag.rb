class Tag < ApplicationRecord
  has_many :assign_book_tags
  has_many :books, through: :assign_book_tags
end
