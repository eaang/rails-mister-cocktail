class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses

  validates :name, presence: true, uniqueness: true

  before_destroy :check_for_doses

  private

  def check_for_doses
    raise StandardError.new("message")
    raise ActiveRecord::InvalidForeignKey.new('This ingredient is being used!') if doses.!empty?
  end
end
