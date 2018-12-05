class AddOblToFixtures < ActiveRecord::Migration[5.2]
  def change
    add_column :fixtures, :obl, :integer
  end
end
