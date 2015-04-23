class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :name
      t.integer :seats
      t.string :address
      t.string :image_url
      t.text :description
      t.time :open_time
      t.time :close_time

      t.timestamps null: false
    end
  end
end
