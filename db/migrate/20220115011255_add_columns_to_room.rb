class AddColumnsToRoom < ActiveRecord::Migration[7.0]
  def change
    change_table :rooms do |t|
      t.string :code
      t.integer :owner_id
    end
  end
end
