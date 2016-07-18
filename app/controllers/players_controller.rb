class PlayersController < ApplicationController

  before_action :authenticate!, only: [:index]

  def new
    # start a new signup record
    @signup = Signup.new
    @players = @signup.players
    @number_of_players = params[:numberToSignup]
  end

  def index 
    signups = Signup.all 
    @players_signups = []
    signups.each do |signup|
      if signup.players.count > 0
        @players_signups << signup
      end
    end
    @players_signups.sort_by!{ |signup| signup.total }.reverse!
  end

end