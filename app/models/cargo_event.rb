class CargoEvent < ApplicationRecord
  belongs_to :fixture_cargo
  belongs_to :demurrage_calculation
  belongs_to :event
end
