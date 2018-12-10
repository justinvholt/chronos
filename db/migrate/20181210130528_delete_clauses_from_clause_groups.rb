class DeleteClausesFromClauseGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :clause_groups, :clause_id
  end
end
