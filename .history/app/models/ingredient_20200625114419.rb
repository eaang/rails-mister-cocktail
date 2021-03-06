class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses

  validates :name, presence: true, uniqueness: true

  before_destroy :check_for_doses

  private

  def check_for_doses
    raise ActiveRecord::InvalidForeignKey.new('This ingredient is being used!') if doses.!empty?
    fail 'This ingredient is being used!'
  end
end
