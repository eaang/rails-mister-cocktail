class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, presence: true, uniqueness: true
  has_many_attached :photo
  
  before_validation :check_anon

  def check_anon
    self.name.strip!
    if self.name == ""
      self.name = 'Anonymous'
    end
  end
end
