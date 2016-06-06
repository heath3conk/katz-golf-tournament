class Diner < ActiveRecord::Base

  validates :diner_first_name, presence: true
  validates :diner_last_name, presence: true

  belongs_to :signup

end
