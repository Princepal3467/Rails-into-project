class Workout < ApplicationRecord
  has_many :workout_exercises, dependent: :destroy
  has_many :exercises, through: :workout_exercises

  validates :name, presence: true, uniqueness: true
  validates :difficulty, presence: true
  validates :duration_minutes, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { minimum: 10 }
end