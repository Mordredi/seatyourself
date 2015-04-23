class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.text :about
      t.string :avatar_url, :default => 'http://www.artofhustle.com/wp-content/uploads/featured/default-avatar_150x150.jpg'

      t.timestamps null: false
    end
  end
end
