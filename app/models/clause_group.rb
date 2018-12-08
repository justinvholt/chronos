class ClauseGroup < ApplicationRecord
  has_many :fixtures
  has_many :clauses, through: :clause_group_joins
end
