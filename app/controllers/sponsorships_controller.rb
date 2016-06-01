class SponsorshipsController < ApplicationController

  def new
    # start a new signup record
    @signup = Signup.new
    @diners = @signup.diners
  end

end