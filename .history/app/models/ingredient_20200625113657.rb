class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses

  validates :name, presence: true, uniqueness: true

  before_destroy :check_for_doses

  private

  def check_for_doses
    if doses.count > 0
      return false
      raise "cannot delete ingredients while doses exist"
    end
  end
end
