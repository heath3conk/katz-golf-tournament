class Sponsorship < ActiveRecord::Base

  belongs_to :signup

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

end
