class AddPublicationDateToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :publication_date, :datetime
  end
end
