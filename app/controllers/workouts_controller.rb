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

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    workout = Workout.find(params[:id])
    workout.update(workout_params)
    redirect_to workout
  end

  def destroy
    workout = Workout.find(params[:id])
    workout.destroy
    redirect_to workouts_path
  end


private
  def workout_params
    params.require(:workout).permit(:title, :description)
  end
end
