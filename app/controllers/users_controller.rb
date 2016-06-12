class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(register_params)
    if @user.role == "boss" && @user.save
      session[:user_id] = @user.id
      redirect_to signups_path(@user)
    else 
      redirect_to users_new_path(@user), flash: { error: "Something went wrong. Please try again." }
    end
  end

  def show

  end

  private 

  def register_params
      p params 
      params.require(:user).permit(:username, :password, :email, :role)
  end

end