class Fixture < ApplicationRecord
  has_many :fixture_cargos, inverse_of: :fixture

  # Required for cocoon nested forms gem
  accepts_nested_attributes_for :fixture_cargos, reject_if: :all_blank, allow_destroy: true
end
