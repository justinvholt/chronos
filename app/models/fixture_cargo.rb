class FixtureCargo < ApplicationRecord
  belongs_to :fixture
  has_many :cargo_handlings
end
