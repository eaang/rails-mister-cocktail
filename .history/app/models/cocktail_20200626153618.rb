class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true

  before_save :downcase_name

  def downcase_name
    self.name = name.downcase
  end

end
