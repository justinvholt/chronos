class AddOblToFixtureCargos < ActiveRecord::Migration[5.2]
  def change
    add_column :fixture_cargos, :obl, :integer
  end
end
