class CreateRoomUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :room_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.boolean :host, null: false, default: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end

    # Users are unique in a room
    add_index :room_users, %i[user_id room_id], unique: true

    # Rooms should only ever have one host
    add_index :room_users, %i[room_id user_id host], unique: true
  end
end
