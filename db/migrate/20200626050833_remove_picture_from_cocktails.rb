class RemovePictureFromCocktails < ActiveRecord::Migration[6.0]
  def change
    remove_column :cocktails, :picture, :string
  end
end
