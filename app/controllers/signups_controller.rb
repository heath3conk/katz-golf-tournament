class SignupsController < ApplicationController

  before_action :set_signup, only: [:update, :show, :edit]
  before_action :authenticate!, only: [:index, :destroy]

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

  def show
    
  end

  def index
    # if !logged_in?
    #   redirect_to new_session_path
    # else 
      @signups = Signup.all.sort_by{ |signup| signup.total }
    # end
  end

  def edit

  end

  def update
    @signup = Signup.find params[:id] 
    
    if params[:changePaidStatus]
      @signup.change_paid_status
      if request.xhr?
        render json: { paidStatus: @signup.paid_status }
      else 
        redirect_to @signup
      end  
    else
      @signup.update_attributes(signup_params) 
    end
  end

  private

    def signup_params
      p params 
      params.require(:signup).permit(:first_name, :last_name, :company_name, :email, :street_address, :city, :state, :zip, :contact_number, :additional_donation, :paid_status, :id, players_attributes: [:id, :player_first_name, :player_last_name], diners_attributes: [:id, :diner_first_name, :diner_last_name], sponsorship_attributes: [:id, :buffet, :beverage_cart, :at_the_turn, :closest_to_pin, :longest_drive, :tee_box])
    end

    def set_signup
      @signup = Signup.find(params[:id])
    end

end