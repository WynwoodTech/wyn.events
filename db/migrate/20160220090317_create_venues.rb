class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state
      t.integer :zip
      t.string :name

      t.timestamps null: false
    end
  end
end
