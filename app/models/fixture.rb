class Fixture < ApplicationRecord
  has_many :fixture_cargos, inverse_of: :fixture

  # validates :reference_no, presence: true, numericality: { greater_than: 0 }
  # validates :vessel_name, presence: true
  # validates :charterer, presence: true
  # validates :voyage_number, presence: true, numericality: { greater_than: 0 }
  # validates :demurrage_rate, presence: true, numericality: { greater_than: 0, only_integer: true }
  # validates :allowed_laytime, presence: true, numericality: { greater_than: 0 }
  # validates :clause_group_id, presence: true, numericality: { greater_than: 0 }

  # Required for cocoon nested forms gem
  accepts_nested_attributes_for :fixture_cargos, reject_if: :all_blank, allow_destroy: true
end
