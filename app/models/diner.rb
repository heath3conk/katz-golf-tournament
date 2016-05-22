class Diner < ActiveRecord::Base

  validates :diner_name, presence: true

  belongs_to :signup

end
