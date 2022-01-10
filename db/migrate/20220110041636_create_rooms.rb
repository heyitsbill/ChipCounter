class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :password
      t.string :state
      t.string :blinds
      t.string :description

      t.timestamps
    end
  end
end
