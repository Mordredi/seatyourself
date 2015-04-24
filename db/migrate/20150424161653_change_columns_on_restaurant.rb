class ChangeColumnsOnRestaurant < ActiveRecord::Migration
  def change
    change_column :restaurants, :open_time, :datetime
    change_column :restaurants, :close_time, :datetime
  end
end
