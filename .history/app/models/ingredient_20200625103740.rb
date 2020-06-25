class Ingredient < ApplicationRecord
  has_many :cocktails
  has_many :ingredients, through: :doses
end
