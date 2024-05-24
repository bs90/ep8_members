class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name_roma, limit: 30
      t.string :name_kata, limit: 50
      t.string :email, null: false, limit: 255
      t.date :date_of_birth
      t.string :address, limit: 255
      t.integer :original_role
      t.integer :training_role
      t.integer :role

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
