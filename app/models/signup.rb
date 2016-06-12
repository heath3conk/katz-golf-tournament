class Signup < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :contact_number, format: { with: /\(?\d{3}(\)|\.|-)? ?\d{3}(\.|-)?\d{4}/i, on: :create }
  validates :contact_number, presence: true

  after_validation :normalize_phone_number, on: [:create, :update]

  has_one :sponsorship
  accepts_nested_attributes_for :sponsorship
  has_many :players
  accepts_nested_attributes_for :players
  has_many :diners
  accepts_nested_attributes_for :diners

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
    self.save
  end

  def sort_by_total
    self.sort do | a, b |
      if a.total > b.total
        a <=> b
      end
    end

  end

  private

  def normalize_phone_number
    working_number = self.contact_number
    working_number.gsub!(/\D/, "")
    working_number.insert(0, "(").insert(4, ") ").insert(9, "-")
    self.contact_number = working_number.slice(0..13)
  end
  

end
