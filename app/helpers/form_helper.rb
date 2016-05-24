module FormHelper

  def setup_signup(signup)
    signup.players ||= Player.new
    4.times { signup.players.build }

    signup.diners ||= Diner.new
    2.times { signup.diners.build }

    signup.sponsorships ||= Sponsorship.new

    signup
  end

end