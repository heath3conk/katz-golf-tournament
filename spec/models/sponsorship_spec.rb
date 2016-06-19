require 'rails_helper'

RSpec.describe Sponsorship, type: :model do
  let!(:sponsorship) { Sponsorship.create!(
    buffet: 1,
    beverage_cart: 1,
    closest_to_pin: 1
    ) }

  describe "#sponsor_total" do
    it "calculates the total donation with zero tee boxes" do
      expect(sponsorship.sponsor_total).to eq(2450)
    end

    it "calculates the total donation with one tee box" do
      sponsorship.tee_box = 1
      expect(sponsorship.sponsor_total).to eq(2700)
    end 

    it "calculates the total donation with more than one tee box" do
      sponsorship.tee_box = 4
      expect(sponsorship.sponsor_total).to eq(3150)
    end
  end

  describe "#selected_sponsorships" do
    it "creates a collection that includes the correct sponsorships (and empty strings for the others)" do
      expect(sponsorship.selected_sponsorships).to eq(["Buffet Sponsorship", "Beverage Cart Sponsorship", "", "Closest to Pin Sponsorship", ""])
    end

    it "creates a collection that includes the correct sponsorships, including tee boxes" do
      sponsorship.tee_box = 3
      expect(sponsorship.selected_sponsorships).to eq(["Buffet Sponsorship", "Beverage Cart Sponsorship", "", "Closest to Pin Sponsorship","", "3 Tee Box Sign(s)"])
    end
  end
end
