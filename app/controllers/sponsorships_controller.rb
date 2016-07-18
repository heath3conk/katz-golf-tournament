class SponsorshipsController < ApplicationController

  before_action :authenticate!, only: [:index]

  def new
    @signup = Signup.new
  end

  def index 
    signups = Signup.all 
    @sponsors_signups = []
    signups.each do |signup|
      if signup.sponsorship
        @sponsors_signups << signup
      end
    end
    @sponsors_signups.sort_by!{ |signup| signup.total }.reverse!
  end

end