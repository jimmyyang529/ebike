class AddColumnToUbike < ActiveRecord::Migration[5.0]
  def change
    add_column :ubikes, :ubike_id, :integer
  end
end
