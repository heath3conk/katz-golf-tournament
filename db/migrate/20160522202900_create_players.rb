class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :signup_id
      t.string :player_name

      t.timestamps null: false
    end
  end
end
