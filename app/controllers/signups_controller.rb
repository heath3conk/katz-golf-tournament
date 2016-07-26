class SignupsController < ApplicationController

  before_action :set_signup, only: [:update, :show, :edit]
  before_action :authenticate!, only: [:index, :destroy]

  def create
    @signup = Signup.new(signup_params)
    p "Create signup ccccccccccccccccccc"
    if @signup.save
      redirect_to signup_path(@signup)
    else
      case params[:commit]
      when "Add players"
        # figure out how to send params to the view????
        # maybe use an 'edit_players' path???
        redirect_to new_players_path(@signup), flash: { errors: @signup.errors.full_messages }
      when "Add sponsorships"
        redirect_to new_sponsorships_path(@signup), flash: { errors: @signup.errors.full_messages }
      when "Add diners"
        redirect_to new_diners_path(@signup), flash: { errors: @signup.errors.full_messages }
      end
    end
  end

  def show
    
  end

  def index
    @signups = Signup.all.sort_by{ |signup| signup.total }.reverse
  end

  def edit
    signup = Signup.find params[:id]
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
      if @signup.sponsorship
        @signup.sponsorship.store_tee_box
      end
      @signup.update_attributes(signup_params)
      p "update signup uuuuuuuuuuuuuuuuuuuuuuuuuuu"
      p signup_params
      redirect_to @signup 
    end
  end

  private

    def signup_params
      params.require(:signup).permit(:first_name, :last_name, :company_name, :email, :street_address, :city, :state, :zip, :contact_number, :additional_donation, :paid_status, :id, players_attributes: [:id, :player_first_name, :player_last_name], diners_attributes: [:id, :diner_first_name, :diner_last_name], sponsorship_attributes: [:id, :buffet, :beverage_cart, :at_the_turn, :closest_to_pin, :longest_drive, :tee_box, :tee_box_1, :tee_box_2, :tee_box_3, :tee_box_4, :tee_box_5])
    end

    def set_signup
      @signup = Signup.find(params[:id])
    end

end