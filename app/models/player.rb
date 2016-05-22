class Player < ActiveRecord::Base

  validates :player_name, presence: :true

  belongs_to :signup

end
