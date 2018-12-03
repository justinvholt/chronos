class CreateFixtures < ActiveRecord::Migration[5.2]
  def change
    create_table :fixtures do |t|
      t.string :charterer
      t.sting :vessel_name
      t.integer :voyage_number
      t.float :demurrage_rate
      t.integer :allowed_laytime
      t.references :fixture_clause, foreign_key: true
      t.integer :laytime_used
      t.float :total_demurrage
      t.string :calculation_status

      t.timestamps
    end
  end
end
