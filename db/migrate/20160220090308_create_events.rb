class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.datetime :start_time
      t.datetime :end_time
      t.string :link
      t.integer :venue_id
      t.integer :organizer_id

      t.timestamps null: false
    end
  end
end
