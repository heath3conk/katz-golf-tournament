class SignupsController < ApplicationController

  before_action :set_signup, only: [:update, :show]

  def create
    @signup = Signup.new(signup_params)

    if @signup.save
      redirect_to signup_path(@signup)
    else
      case params[:commit]
      when "Add players"
        redirect_to new_players_path(@signup), flash: { errors: @signup.errors.full_messages }
      end
    end
  end

  def update
    @signup
  end

  def show
    @signup = Signup.find(params[:id])
  end

  private

    def signup_params
      p params 
      params.require(:signup).permit(:first_name, :last_name, :company_name, :email, :street_address, :city, :state, :zip, :contact_number, :additional_donation, players_attributes: [:player_first_name, :player_last_name], diners_attributes: [:diner_first_name, :diner_last_name], sponsorships_attributes: [:sponsorship_type])
    end

    def set_signup
      @signup = Signup.find(params[:id])
    end

end