class AddPermalinkToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :permalink, :string
  end
end
