class AddCpFormToClauses < ActiveRecord::Migration[5.2]
  def change
    add_column :clauses, :cp_form, :string
  end
end
