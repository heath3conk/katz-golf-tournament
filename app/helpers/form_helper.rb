module FormHelper

  def setup_signup(signup, players_quantity, diners_quantity)
    p signup
    p players_quantity
    signup.players ||= Player.new
    players_quantity.times { signup.players.build }

    signup.diners ||= Diner.new
    diners_quantity.times { signup.diners.build }

    signup.sponsorship ||= Sponsorship.new

    signup
  end

end