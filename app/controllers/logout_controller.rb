class LogoutController < ApplicationController
  def index
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end