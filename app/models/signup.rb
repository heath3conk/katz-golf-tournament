class Signup < ActiveRecord::Base

  validates :contact_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, presence: true, uniqueness: true
  validates :full_address, presence: true
  validates :contact_number, format: { with: /\(?\d{3}(\)|\.|-)? ?\d{3}(\.|-)?\d{4}/i, on: :create }
  validates :contact_number, presence: true, uniqueness: true

  has_many :sponsorships
  accepts_nested_attributes_for :sponsorships
  has_many :players
  accepts_nested_attributes_for :players
  has_many :diners
  accepts_nested_attributes_for :diners

  attr_accessor :street_address, :city, :state, :zip, :first_name, :last_name
  before_validation :store_full_address, on: :create
  before_validation :store_contact_name, on: :create

  def store_contact_name
    self.contact_name = "#{self.first_name} #{self.last_name}"
  end

  def store_full_address
    self.full_address = "#{self.street_address}, #{self.city}, #{self.state} #{self.zip}"
  end

  def total
    self.total = self.additional_donation + (self.players.count * 150)
  end


  private

  

end
