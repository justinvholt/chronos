class CreateFixtureCargos < ActiveRecord::Migration[5.2]
  def change
    create_table :fixture_cargos do |t|
      t.string :name
      t.integer :quantity_mts
      t.references :fixture, foreign_key: true
      t.string :load_port
      t.string :load_terminal
      t.string :load_berth
      t.string :disch_port
      t.string :disch_terminal
      t.string :disch_berth

      t.timestamps
    end
  end
end
