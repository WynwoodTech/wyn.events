class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.string :name
      t.string :image_url
      t.string :website
      t.string :email

      t.timestamps null: false
    end
  end
end
