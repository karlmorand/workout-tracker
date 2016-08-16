class WorkoutsController < ApplicationController
  def index
    @workouts = User.find(session[:user]["id"]).workouts
  end

  def new
    @workout = Workout.new
  end

  def create
    @user = User.find(session[:user]["id"])
    @workout = @user.workouts.create!(workout_params)
    redirect_to workouts_path
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
