class RemoveProcServiceFromClauses < ActiveRecord::Migration[5.2]
  def change
    remove_column :clauses, :proc_service, :string
  end
end
