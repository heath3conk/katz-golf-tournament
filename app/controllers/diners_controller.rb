class DinersController < ApplicationController

  before_action :authenticate!, only: [:index]

  def new
    @signup = Signup.new
  end

  def index 
    signups = Signup.all 
    @diners_signups = []
    signups.each do |signup|
      if signup.diners.count > 0
        @diners_signups << signup
      end
    end
    @diners_signups.sort_by!{ |signup| signup.total }.reverse!
  end

end