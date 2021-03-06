class Review < ApplicationRecord
  belongs_to :cocktail
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: 0..5

  before_validation :check_anon

  def check_anon
    name.strip!
    self.name = 'Anonymous' if name == ''
  end
end
