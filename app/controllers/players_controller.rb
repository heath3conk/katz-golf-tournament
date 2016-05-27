class PlayersController < ApplicationController

  def new
    # start a new signup record
    @signup = Signup.new
    @players = @signup.players
    # render partial: 'new_player', locals: { errors: @errors }
  end

end