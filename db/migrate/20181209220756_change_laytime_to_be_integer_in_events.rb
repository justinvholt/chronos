class ChangeLaytimeToBeFloatInEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :laytime, :float
  end
end
