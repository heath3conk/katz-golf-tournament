module FormHelper

  def setup_signup(signup, players_quantity=4, diners_quantity=2)
    signup.players ||= Player.new
    players_quantity.times { signup.players.build }

    signup.diners ||= Diner.new
    diners_quantity.times { signup.diners.build }

    signup.sponsorship ||= Sponsorship.new

    @signup
  end

end