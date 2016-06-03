class SignupsController < ApplicationController

  before_action :set_signup, only: [:update, :show]
  # before_action :authenticate!, only: [:index, :destroy]

  def create
    p "you're supposed to be in update!!"
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

  def show
    @signup = Signup.find(params[:id])
  end

  def index
    # if !logged_in?
    #   redirect_to new_session_path
    # else 
      players_signups = []
      sponsorship_signups = []
      diners_signups = []
      Signup.all.each do |signup|
        if signup.players.count > 0 
          players_signups << signup
        elsif signup.sponsorship.count > 0
          sponsorship_signups << signup
        else
          diners_signups << signup
        end
      end
    # end
    @all_signups = [players_signups, sponsorship_signups, diners_signups]
  end

  def update
    @signup = Signup.find params[:id] 
    if request.xhr?
      @signup.change_paid_status
      return "#{@signup.paid_status}"
    else
    end
  end

  private

    def signup_params
      p params 
      params.require(:signup).permit(:first_name, :last_name, :company_name, :email, :street_address, :city, :state, :zip, :contact_number, :additional_donation, :paid_status, players_attributes: [:player_first_name, :player_last_name], diners_attributes: [:diner_first_name, :diner_last_name], sponsorship_attributes: [:buffet, :beverage_cart, :at_the_turn, :closest_to_pin, :longest_drive, :tee_box])
    end

    def set_signup
      @signup = Signup.find(params[:id])
    end

end