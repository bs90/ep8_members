class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name_roma
      t.string :name_kata
      t.string :email
      t.date :date_of_birth
      t.string :address
      t.integer :original_role
      t.integer :training_role
      t.integer :role

      t.timestamps
    end
  end
end
