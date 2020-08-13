class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id.to_s
      redirect_to main_path, notice: 'Successfully logged in!'
    else
      flash.now.alert = "Incorrect email or password, try again."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to log_in_path, notice: "Logged out!"
  end

 end
