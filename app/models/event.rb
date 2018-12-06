class Event < ApplicationRecord
  has_many :cargo_handlings
  has_many :fixture_cargos, through: :cargo_handlings
end
