class DeleteColumnFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :date
  end
end
