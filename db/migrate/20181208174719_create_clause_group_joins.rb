class CreateClauseGroupJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :clause_group_joins do |t|
      t.references :clause, foreign_key: true
      t.references :clause_group, foreign_key: true

      t.timestamps
    end
  end
end
