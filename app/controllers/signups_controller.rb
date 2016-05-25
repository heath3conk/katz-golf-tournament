class SignupsController < ApplicationController

  before_action :set_signup, only: [:edit, :show]

  def create
    @signup = Signup.new(signup_params)

    if @signup.save
      redirect_to @signup, notice: 'Your signup was successful. Thank you!'
    else
      render :edit
    end
  end

  def edit
    @signup = Signup.find(params[:id])
  end

  def show
    @signup = Signup.find(params[:id])
  end

end