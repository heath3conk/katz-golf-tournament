class Player < ActiveRecord::Base

  validates :player_first_name, presence: :true
  validates :player_last_name, presence: :true

  belongs_to :signup

end
