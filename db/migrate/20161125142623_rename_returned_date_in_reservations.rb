class RenameReturnedDateInReservations < ActiveRecord::Migration[5.0]
  def change
    rename_column :reservations, :returned_date, :return_date
  end
end
