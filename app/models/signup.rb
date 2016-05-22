class Signup < ActiveRecord::Base

  validates :contact_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :address, presence: true
  validates :contact_number, presence: true, uniqueness: true

  has_many :sponsorships
  has_many :players
  has_many :diners

end
