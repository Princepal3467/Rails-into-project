class CreateExercises < ActiveRecord::Migration[8.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :equipment
      t.string :reps
      t.string :sets
      t.text :instructions
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
