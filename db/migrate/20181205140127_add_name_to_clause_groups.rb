class AddNameToClauseGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :clause_groups, :name, :string
  end
end
