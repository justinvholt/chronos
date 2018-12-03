class Fixture < ApplicationRecord
  belongs_to :demurrage_calculation
  belongs_to :fixture_clause
end
