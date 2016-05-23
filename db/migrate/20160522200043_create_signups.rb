class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :contact_name
      t.string :company_name
      t.string :email
      t.string :address
      t.string :contact_number
      t.integer :additional_donation
      t.integer :total
      t.integer :paid_status

      t.timestamps null: false
    end
  end
end
