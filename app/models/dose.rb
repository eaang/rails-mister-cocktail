class Dose < ApplicationRecord
  belongs_to :cocktails
  belongs_to :ingredients

  validates :description, presence: true
end
