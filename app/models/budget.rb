# budget.rb
class Budget < ApplicationRecord
    belongs_to :objective
    belongs_to :radius
  end
  