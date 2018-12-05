class AddParentRelationToClauses < ActiveRecord::Migration[5.2]
  def change
    add_column :clauses, :parent_relation, :string
  end
end
