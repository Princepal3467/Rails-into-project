class CreateWorkouts < ActiveRecord::Migration[8.1]
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :difficulty
      t.integer :duration_minutes
      t.text :description

      t.timestamps
    end
  end
end
