class Signup < ActiveRecord::Base

  validates :contact_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, presence: true, uniqueness: true
  validates :full_address, presence: true
  validates :contact_number, format: { with: /\(?\d{3}(\)|\.|-)? ?\d{3}(\.|-)?\d{4}/i, on: :create }
  validates :contact_number, presence: true, uniqueness: true

  has_many :sponsorships
  has_many :players
  has_many :diners

  attr_accessor :street_address, :city, :state, :zip, :first_name, :last_name
  before_validation :full_address, on: :create
  before_validation :contact_name, on: :create

  def contact_name
    self.contact_name = "#{self.first_name} #{self.last_name}"
  end

  def full_address
    self.full_address = "#{self.street_address}, #{self.city}, #{self.state} #{self.zip}"
  end

end
