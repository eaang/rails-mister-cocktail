class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, presence: true, uniqueness: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: 0..5
  has_many_attached :photo

  before_validation :check_anon

  def check_anon
    name.strip!
    self.name = 'Anonymous' if name == ''
  end
end
