class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if(@user.password_digest == @user.password_confirmation)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_url, notice: "Thank you for signing up!"
      else
        redirect_to '/user/new'
      end
    else
      flash.now.alert = "Password did not match!"
      render "new"
      
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password_digest,
      :password_confirmation
    )
  end
end
