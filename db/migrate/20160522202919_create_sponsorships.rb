class CreateSponsorships < ActiveRecord::Migration
  def change
    create_table :sponsorships do |t|
      t.integer :signup_id
      t.string :sponsorship_type

      t.timestamps null: false
    end
  end
end
