class Ingredient < ApplicationRecord
  has_many :doses, dependant: :restrict_with_error
  has_many :cocktails, through: :doses

  validates :name, presence: true, uniqueness: true
end
