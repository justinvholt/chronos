class CreateFixtureClauses < ActiveRecord::Migration[5.2]
  def change
    create_table :fixture_clauses do |t|
      t.references :clause, foreign_key: true

      t.timestamps
    end
  end
end
