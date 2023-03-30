class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false, default: ""
      t.string :number, null: false, default: ""
      t.boolean :private, null: false, default: false

      t.timestamps
    end

    add_index :rooms, :name
    add_index :rooms, :number, unique: true
  end
end
