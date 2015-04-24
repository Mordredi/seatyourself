class RemoveColumnFromRestaurant < ActiveRecord::Migration
  def change
    remove_column :restaurants, :open_time, :datetime
    remove_column :restaurants, :close_time, :datetime
  end
end
