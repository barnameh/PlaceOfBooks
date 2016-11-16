class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :ISBN
      t.text :detail
      t.boolean :available
    end
  end
end
