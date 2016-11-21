class AddMoreFieldsToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :num_pages, :integer
    add_column :books, :book_cover, :string
    add_column :books, :image_file_name, :string, default:""
  end
end
