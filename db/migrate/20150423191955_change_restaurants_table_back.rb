class ChangeRestaurantsTableBack < ActiveRecord::Migration
  def change
    change_column :restaurants, :open_time, :time
    change_column :restaurants, :close_time, :time
  end
end
