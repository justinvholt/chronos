class CargoHandling < ApplicationRecord
  belongs_to :fixture_cargo
  belongs_to :event
end
