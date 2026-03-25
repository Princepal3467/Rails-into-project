class Exercise < ApplicationRecord
  belongs_to :category
  has_many :workout_exercises, dependent: :destroy
  has_many :workouts, through: :workout_exercises

  validates :name, presence: true, uniqueness: true
  validates :equipment, presence: true
  validates :reps, presence: true
  validates :sets, presence: true
  validates :instructions, presence: true, length: { minimum: 10 }
end