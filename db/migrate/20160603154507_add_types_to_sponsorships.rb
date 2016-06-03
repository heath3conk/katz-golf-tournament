class AddTypesToSponsorships < ActiveRecord::Migration
  def change
    add_column :sponsorships, :buffet, :integer, default: 0
    add_column :sponsorships, :beverage_cart, :integer, default: 0
    add_column :sponsorships, :at_the_turn, :integer, default: 0
    add_column :sponsorships, :closest_to_pin, :integer, default: 0
    add_column :sponsorships, :longest_drive, :integer, default: 0
    add_column :sponsorships, :tee_box, :integer, default: 0
    remove_column :sponsorships, :sponsorship_type, :string
  end
end
