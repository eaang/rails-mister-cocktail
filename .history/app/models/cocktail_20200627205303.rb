class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true

  after_validation :tidy_input

  def tidy_input
    self.name = name.downcase
    direction.gsub(".)", ").")
    direction.gsub(".]", "].")
  end
end
