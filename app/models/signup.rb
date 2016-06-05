class Signup < ActiveRecord::Base

  validates :contact_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, presence: true, uniqueness: true
  validates :full_address, presence: true
  validates :contact_number, format: { with: /\(?\d{3}(\)|\.|-)? ?\d{3}(\.|-)?\d{4}/i, on: :create }
  validates :contact_number, presence: true, uniqueness: true

  has_one :sponsorship
  accepts_nested_attributes_for :sponsorship
  has_many :players
  accepts_nested_attributes_for :players
  has_many :diners
  accepts_nested_attributes_for :diners

  attr_accessor :street_address, :city, :state, :zip, :first_name, :last_name
  before_validation :store_full_address, on: :create
  before_validation :store_contact_name, on: :create

  # attr_reader :contact_name, :full_address

  def store_contact_name
    self.contact_name = "#{self.first_name} #{self.last_name}"
  end

  def store_full_address
    self.full_address = "#{self.street_address}, #{self.city}, #{self.state} #{self.zip}"
  end

  def total
    if self.additional_donation
      self.total = self.additional_donation + self.signup_type_donation
    else
      self.total = self.signup_type_donation
    end
  end

  def signup_type_donation
    if self.players.count > 0
      self.players.count * 150
    elsif self.diners.count > 0
      self.diners.count * 40
    else
      self.sponsorship.sponsor_total
    end
  end

  def change_paid_status
    if self.paid_status == "unpaid"
      self.paid_status = "paid"
    else
      self.paid_status = "unpaid"
    end
  end

  private

  

end
