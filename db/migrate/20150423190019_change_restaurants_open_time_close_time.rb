class ChangeRestaurantsOpenTimeCloseTime < ActiveRecord::Migration
  def change
    change_column :restaurants, :open_time, :integer
    change_column :restaurants, :close_time, :integer
  end
end
