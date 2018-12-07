class AddProcServiceToClauses < ActiveRecord::Migration[5.2]
  def change
    add_column :clauses, :proc_service, :jsonb
  end
end
