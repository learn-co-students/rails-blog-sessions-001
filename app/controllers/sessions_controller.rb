class SessionsController < ApplicationController
  before_action :set_user, only: [:main_page]

  def main_page
  end

  def login
  end

  def authenticate

    @user = User.find_by(email: session_params[:email])

    if @user && @user.authenticate(session_params[:password]) == @user
      session[:user_id] = @user.id
      redirect_to '/' and return
    else
      redirect_to '/sessions' and return
    end

  end

  def logout
    session[:user_id] = nil
    redirect_to :main_page
  end

private

  def set_user
    if session[:user_id] != nil
      @user = User.find(session[:user_id])
    end
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end


end