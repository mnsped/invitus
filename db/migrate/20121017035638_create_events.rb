class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.string :map_url
      t.datetime :start_time
      t.datetime :end_time
      t.string :image_url
      t.string :description
      t.string :map_html
      t.boolean :active

      t.timestamps
    end
  end
end
