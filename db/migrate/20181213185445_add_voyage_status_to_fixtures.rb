class AddVoyageStatusToFixtures < ActiveRecord::Migration[5.2]
  def change
    add_column :fixtures, :required_action, :string
    add_column :fixtures, :days_until_completion, :integer
    add_column :fixtures, :voyage_status, :string
  end
end
