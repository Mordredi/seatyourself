class AddColumnToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :open, :integer
    add_column :restaurants, :close, :integer
  end
end
