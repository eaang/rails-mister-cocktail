class Cocktail < ApplicationRecord
  has_many :doses
  has_and_belongs_to_many :ingredients
end