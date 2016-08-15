class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to 'workouts_url'
    else
      redirect_to 'new_workout_url'
    end
  end

  def show
    @workout = Workout.find(params[:id])

  end


private
  def workout_params
    params.require(:workout).permit(:title, :description)
  end
end
