class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses

  validates :name, presence: true, uniqueness: true

  before_destroy :check_for_doses

  private

  def check_for_doses
    raise ActiveRecord::InvalidForeignKey.new if doses.length.positive?
  end
end
