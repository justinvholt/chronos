class FixtureCargo < ApplicationRecord
  belongs_to :fixture, inverse_of: :fixture_cargoes
  has_many :cargo_handlings, inverse_of: :fixture_cargo
end
