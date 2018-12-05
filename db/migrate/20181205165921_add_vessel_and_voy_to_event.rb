class AddVesselAndVoyToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :vessel_name, :string
    add_column :events, :voyage_number, :integer
  end
end
