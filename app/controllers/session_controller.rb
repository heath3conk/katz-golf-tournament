class SessionController < ApplicationController

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      p "user okay"
      login(@user)
      redirect_to signups_path(@user)
    else
      p "problem user"
      redirect_to new_session_path(@user), flash: { error: "Invalid credentials, please try again." }
    end
  end

  def new
    @user = User.new
    # redirect_to new_session_path(@user)
  end

  def destroy
    logout
    redirect_to root_url
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete(:user_id)
  end

end