class RemoveIsbnFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :ISBN, :string
  end
end
