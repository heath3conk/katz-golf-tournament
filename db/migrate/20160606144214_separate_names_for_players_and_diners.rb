class SeparateNamesForPlayersAndDiners < ActiveRecord::Migration
# same problem with editing virtual attributes, described in the
# migration for signups to add name & address details

  def change
    add_column :players, :player_first_name, :string
    add_column :players, :player_last_name, :string
    remove_column :players, :player_name, :string

    add_column :diners, :diner_first_name, :string
    add_column :diners, :diner_last_name, :string
    remove_column :diners, :diner_name, :string
  end
end
