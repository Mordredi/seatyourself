class AddColumnToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :open, :integer, :default => 11
    add_column :restaurants, :close, :integer, :default => 24
  end
end
