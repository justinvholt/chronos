class AddDummyToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :dummy, :boolean, null: false, default: false
  end
end
