class AddRatingsToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :rating, :decimal
  end
end
