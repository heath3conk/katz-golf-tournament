class Diner < ActiveRecord::Base

  validates :diner_name, presence: true

  belongs_to :signup

  attr_accessor :diner_first_name, :diner_last_name
  before_validation :diner_name, on: :create

  def diner_name
    self.diner_name = "#{self.diner_first_name} #{self.diner_last_name}"
  end

end
