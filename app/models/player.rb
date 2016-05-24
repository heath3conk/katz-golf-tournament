class Player < ActiveRecord::Base

  validates :player_name, presence: :true

  belongs_to :signup

  attr_accessor :player_first_name, :player_last_name
  before_validation :player_name, on: :create

  def player_name
    self.player_name = "#{self.player_first_name} #{self.player_last_name}"
  end

end
