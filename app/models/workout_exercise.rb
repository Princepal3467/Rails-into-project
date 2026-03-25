class WorkoutExercise < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise

  validates :position, presence: true, numericality: { greater_than: 0 }
  validates :exercise_id, uniqueness: { scope: :workout_id }
end