class UsersController < ApplicationController
  skip_before_action :authenticate

  def sign_up
  end

  def sign_up!
    user = User.new(
      username: params[:username],
      password_digest: BCrypt::Password.create(params[:password])
    )

    if params[:password_confirmation] != params[:password]
      message = "Your passwords don't match"
    elsif user.save
      message = "Your account has been created!"
    else
      message = "Your account couldn't be created"
    end
    flash[:notice] = message
    redirect_to action: :sign_up
  end

  def sign_in
  end

  def sign_in!
    @user = User.find_by(username: params[:username])
    if !@user
      message = "User doesn't exist"
    elsif !BCrypt::Password.new(@user.password_digest).is_password?(params[:password])
      message = "Wrong password"
    else
      message = "You're signed in, #{@user.username}"
      cookes[:username] = {
        value: @user.username,
        expires: 100.years.from_now
      }
      session[:user] = @user
    end
    flash[:notice] = message
    redirect_to workouts_path
  end

  def sign_out
    reset_session
    flash[:notice] = "You're signed out"
    redirect_to root_url
  end

end
