class SessionsController < ApplicationController
  def new
    @workout = Workout.find(params[:workout_id])
    @session = Session.new
  end

  def create
    workout = Workout.find(params[:session][:workout_id])
    Session.create(session_params)
    redirect_to workout
  end

  private
  def session_params
    params.require(:session).permit(:author, :sets, :reps, :weight, :notes, :workout_id)
  end
end
