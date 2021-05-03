class LoginController < ApplicationController
  def index
  end

  def create
    @user = User.find_by(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
