class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, presence: true, uniqueness: true
  has_many_attached :photo
end
