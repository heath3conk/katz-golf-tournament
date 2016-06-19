require 'rails_helper'

RSpec.describe Signup, type: :model do
  let!(:signup) { Signup.new(
    first_name: "Susan",
    last_name: "Blue",
    street_address: "123 East Main Road",
    city: "Portsmouth",
    state: "RI",
    zip: "02878",
    company_name: "Blue & Co.",
    email: "sblue@blues.com",
    contact_number: "123-456-7890",
    additional_donation: 25
    )}

  describe "correctly counts the players and diners associated with a signup" do
    before(:each) do
      signup.save
    end

    it "accurately counts players" do
      3.times { signup.players.build }
      signup.players.each do |player|
        player.player_first_name = Faker::Name.first_name
        player.player_last_name = Faker::Name.last_name
        player.save
      end
      expect(signup.players.count).to eq(3)
    end  

    it "accurately counts diners" do
      2.times { signup.diners.build }
      signup.diners.each do |diner|
        diner.diner_first_name = Faker::Name.first_name
        diner.diner_last_name = Faker::Name.last_name
        diner.save
      end
      expect(signup.diners.count).to eq(2)
    end 
  end

  describe "#signup_type_donation" do
    before(:each) do
      signup.save
    end

    it "calculates the donation that is based on the number of players" do
      4.times { signup.players.build }
      signup.players.each do |player|
        player.player_first_name = Faker::Name.first_name
        player.player_last_name = Faker::Name.last_name
        player.save
      end
      expect(signup.signup_type_donation).to eq(600)
    end 

    it "calculates the donation that is based on the number of diners" do
      3.times { signup.diners.build }
      signup.diners.each do |diner|
        diner.diner_first_name = Faker::Name.first_name
        diner.diner_last_name = Faker::Name.last_name
        diner.save
      end
      expect(signup.signup_type_donation).to eq(120)
    end

    it "calculates the donation that's based on the type of sponsorships selected" do
      spons = signup.sponsorship ||= Sponsorship.new
      spons.buffet = 1
      spons.at_the_turn = 1
      spons.closest_to_pin = 1
      expect(signup.signup_type_donation).to eq(1950)
    end
  end

  describe "#total" do
    before(:each) do
      signup.save
    end

    it "accurately calculates donations for sponsorships without tee boxes" do
      spons = signup.sponsorship ||= Sponsorship.new
      spons.buffet = 1
      spons.at_the_turn = 1
      spons.closest_to_pin = 1
      expect(signup.total).to eq(1975)
    end 

    it "accurately calculates donations for sponsorships with multiple tee boxes" do
      spons = signup.sponsorship ||= Sponsorship.new
      spons.beverage_cart = 1
      spons.longest_drive = 1
      spons.tee_box = 3
      expect(signup.total).to eq(1825)
    end

    it "accurately calculates the donation for four players" do
      4.times { signup.players.build }
      signup.players.each do |player|
        player.player_first_name = Faker::Name.first_name
        player.player_last_name = Faker::Name.last_name
        player.save
      end
      expect(signup.total).to eq(625)
    end 

    it "accurately calculates the donation for three diners" do
      3.times { signup.diners.build }
      signup.diners.each do |diner|
        diner.diner_first_name = Faker::Name.first_name
        diner.diner_last_name = Faker::Name.last_name
        diner.save
      end
      expect(signup.total).to eq(145)
    end 
  end

  describe "#change_paid_status" do
    before(:each) do
      signup.save
      signup.change_paid_status
    end

    it "changes the status from paid to unpaid" do
      expect(signup.paid_status).to eq("paid")
    end 

    it "changes the status from unpaid to paid" do
      signup.change_paid_status
      expect(signup.paid_status).to eq("unpaid")
    end
  end

  describe "#normalize_phone_number" do
    it "doesn't mess with a phone number that's input already 'normalized'" do
      phone_num = "(123) 456-7890"
      signup.contact_number = phone_num
      signup.save
      expect(signup.contact_number).to eq("(123) 456-7890")
    end

    it "normalizes a phone number that's input without punctuation" do
      weird_phone_num = "1234567890"
      signup.contact_number = weird_phone_num
      signup.save
      expect(signup.contact_number).to eq("(123) 456-7890")
    end

    it "normalizes a phone number that's input with odd punctuation" do
      weird_phone_num = "123.456-7890"
      signup.contact_number = weird_phone_num
      signup.save
      expect(signup.contact_number).to eq("(123) 456-7890")
    end

    it "normalizes a phone number that's input with dashes/dashes in odd places" do
      weird_phone_num = "123-4567-890"
      signup.contact_number = weird_phone_num
      signup.save
      expect(signup.contact_number).to eq("(123) 456-7890")
    end

  end
end
