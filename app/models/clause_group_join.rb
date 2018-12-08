class ClauseGroupJoin < ApplicationRecord
  belongs_to :clause_group
  belongs_to :clause
end
