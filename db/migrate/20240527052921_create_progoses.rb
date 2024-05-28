class CreateProgoses < ActiveRecord::Migration[7.1]
  def change
    create_table :progoses do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date_test, null: false
      t.integer :range, null: false
      t.text :range_evaluation
      t.integer :accuracy, null: false
      t.text :accuracy_evaluation
      t.integer :fluency, null: false
      t.text :fluency_evaluation
      t.integer :interaction, null: false
      t.text :interaction_evaluation
      t.integer :coherence, null: false
      t.text :coherence_evaluation
      t.integer :phonology, null: false
      t.text :phonology_evaluation
      t.integer :overall, null: false
      t.text :overall_evaluation

      t.timestamps
    end
  end
end
