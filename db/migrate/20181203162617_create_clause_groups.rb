class CreateClauseGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :clause_groups do |t|
      t.references :clause, foreign_key: true

      t.timestamps
    end
  end
end
