class ChangeColumOnRestaurant < ActiveRecord::Migration
  def change
    change_column :restaurants, :open_time, :date_time
    change_column :restaurants, :close_time, :date_time
  end
end
