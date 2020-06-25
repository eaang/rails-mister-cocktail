class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy, foreign_key: :cocktail_id
  has_many :ingredients, through: :doses

  validates :name, presence: true, uniqueness: true
end
