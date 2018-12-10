class FixtureClause < ApplicationRecord
  belongs_to :clause, inverse_of: :fixture_clauses
end
