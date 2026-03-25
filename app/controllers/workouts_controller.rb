class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.includes(:exercises).order(:name)

    if params[:search].present?
      @workouts = @workouts.where("name LIKE ?", "%#{params[:search]}%")
    end

    if params[:difficulty].present?
      @workouts = @workouts.where(difficulty: params[:difficulty])
    end
  end

  def show
    @workout = Workout.find(params[:id])
    @workout_exercises = @workout.workout_exercises.includes(exercise: :category).order(:position)
  end
end