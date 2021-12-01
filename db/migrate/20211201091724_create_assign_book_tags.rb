class CreateAssignBookTags < ActiveRecord::Migration[6.1]
  def change
    create_table :assign_book_tags do |t|
      t.belongs_to :book
      t.belongs_to :tag
      t.timestamps
    end
  end
end
