class SponsorshipsController < ApplicationController

  def new
    @signup = Signup.new
    @diners = @signup.diners
  end

  # def edit
  #   @signup = Signup.find(params[:id])
  # end

end