class CreateEventsUsers < ActiveRecord::Migration
  def change
    create_table :events_users do |t|
      t.integer :event_id
      t.integer :user_id
      t.boolean :attending
      t.string :comment
      t.string :stuff

      t.timestamps
    end
    add_index :events_users, [:event_id, :user_id]
  end
end
