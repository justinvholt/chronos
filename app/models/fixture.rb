class Fixture < ApplicationRecord
  belongs_to :demurrage_calculation
  belongs_to :fixture_clause
  has_many :fixture_cargos, inverse_of: :fixture

  # Required for cocoon nested forms gem
  accepts_nested_attributes_for :fixture_cargos, reject_if: :all_blank, allow_destroy: true
end
