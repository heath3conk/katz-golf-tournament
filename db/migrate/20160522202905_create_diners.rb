class CreateDiners < ActiveRecord::Migration
  def change
    create_table :diners do |t|
      t.integer :signup_id
      t.string :diner_name

      t.timestamps null: false
    end
  end
end
