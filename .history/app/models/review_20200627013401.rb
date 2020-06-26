class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, presence: true, uniqueness: true
  has_many_attached :photo
  
  before_validation :check_anon

  def check_anon
    name.strip!
    self.name = 'Anonymous' if self.name == ""
  end
end
