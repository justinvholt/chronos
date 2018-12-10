class CargoHandling < ApplicationRecord
  belongs_to :fixture_cargo, inverse_of: :cargo_handlings
  belongs_to :event, inverse_of: :cargo_handlings
end
