class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :datetime
      t.string :port
      t.string :terminal
      t.string :berth

      t.timestamps
    end
  end
end
