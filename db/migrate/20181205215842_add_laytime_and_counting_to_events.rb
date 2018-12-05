class AddLaytimeAndCountingToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :counting, :string
    add_column :events, :laytime, :jsonb
  end
end
