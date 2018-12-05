class CreateCargoHandlings < ActiveRecord::Migration[5.2]
  def change
    create_table :cargo_handlings do |t|
      t.references :fixture_cargo, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
