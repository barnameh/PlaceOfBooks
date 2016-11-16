class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :book_id
      t.datetime :loan_date
      t.datetime :due_date
      t.datetime :returned_date
    end
  end
end
