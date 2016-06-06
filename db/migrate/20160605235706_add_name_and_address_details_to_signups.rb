class AddNameAndAddressDetailsToSignups < ActiveRecord::Migration
# started out using virtual attributes for contact_name & full_address
# collected data as separate fields & then combined it to store...
# problem was: re-dividing it to include in the "edit" view for signups

  def change
    add_column :signups, :first_name, :string
    add_column :signups, :last_name, :string
    remove_column :signups, :contact_name, :string

    add_column :signups, :street_address, :string
    add_column :signups, :city, :string
    add_column :signups, :state, :string
    add_column :signups, :zip, :string
    remove_column :signups, :full_address, :string

  end
end
