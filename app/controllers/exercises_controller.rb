class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.includes(:category).order(:name)

    if params[:search].present?
      @exercises = @exercises.where("name LIKE ?", "%#{params[:search]}%")
    end

    if params[:category_id].present?
      @exercises = @exercises.where(category_id: params[:category_id])
    end
  end

  def show
    @exercise = Exercise.find(params[:id])
    @workouts = @exercise.workouts.order(:name)
  end
end