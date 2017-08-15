class CreateUbikes < ActiveRecord::Migration[5.0]
  def change
    create_table :ubikes do |t|
      t.integer :station_number
      t.string :station_name
      t.string :area

      t.timestamps
    end
  end
end
