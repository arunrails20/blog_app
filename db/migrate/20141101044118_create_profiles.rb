class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.integer :user_id
      t.string :address_line_one
      t.string :address_line_two

      t.timestamps
    end
  end
end
