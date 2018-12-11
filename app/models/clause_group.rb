class ClauseGroup < ApplicationRecord
  has_many :fixtures
  serialize :clause_group
  has_many :clause_group_joins
  has_many :clauses, through: :clause_group_joins
end
