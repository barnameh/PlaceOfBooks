class RemoveDetailFromBook < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :detail, :texts
  end
end
