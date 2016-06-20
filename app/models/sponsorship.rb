class Sponsorship < ActiveRecord::Base

  belongs_to :signup

  attr_accessor :tee_box_1, :tee_box_2, :tee_box_3, :tee_box_4, :tee_box_5
  before_save :store_tee_box
  before_update :store_tee_box

  def sponsor_total
    sponsorship_total = 0
    if self.tee_box == 0
      tee_box_total = 0 
    elsif self.tee_box == 1
      tee_box_total = 250
    elsif self.tee_box > 1
      tee_box_total = (self.tee_box - 1) * 150 + 250
    end
    sponsorship_total = (self.buffet * 1200) + (self.beverage_cart * 1000) + (self.at_the_turn * 500) + (self.closest_to_pin * 250) + (self.longest_drive * 250) + tee_box_total
    sponsorship_total
  end

  def selected_sponsorships
    selection = []
    selection << "Buffet Sponsorship" * self.buffet
    selection << "Beverage Cart Sponsorship" * self.beverage_cart
    selection << "At the Turn Sponsorship" * self.at_the_turn
    selection << "Closest to Pin Sponsorship" * self.closest_to_pin
    selection << "Longest Drive Sponsorship" * self.longest_drive
    if tee_box > 0
      selection << "#{self.tee_box} Tee Box Sign(s)"
    end
    selection
  end

  def store_tee_box
    puts "DO WE EVER GET HERE??????"
    if self.tee_box_1 = 1
      self.tee_box = 1
    elsif self.tee_box_2 = 1
      self.tee_box = 2
    elsif self.tee_box_3 = 1
      self.tee_box = 3
    elsif self.tee_box_4 = 1
      self.tee_box = 4
    elsif self.tee_box_5 = 1
      self.tee_box = 5
    else 
      self.tee_box = 0
    end
  end
end
