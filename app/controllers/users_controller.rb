class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    elsif user_params["email"] == ""
      flash[:failure] = "Email can't be blank"
      redirect_to new_user_path
    elsif user_params["password"] == ""
      flash[:failure] = "Password cannot be blank"
      redirect_to new_user_path
    elsif user_params["password_confirmation"] == ""
      flash[:failure] = "Password confirmation cannot be blank"
      redirect_to new_user_path
    elsif user_params["password_confirmation"] != user_params["password"]
      flash[:failure] = "Password confirmation does not match"
      redirect_to new_user_path
    else
      flash[:failure] = "Something went wrong"
      redirect_to new_user_path
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
