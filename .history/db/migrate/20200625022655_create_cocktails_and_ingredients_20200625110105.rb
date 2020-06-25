class CreateCocktailsAndIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.timestamps
    end
 
    create_table :ingredients do |t|
      t.string :name
      t.timestamps
    end
 
    create_table :doses do |t|
      t.belongs_to :cocktail
      t.belongs_to :ingredient
      t.string :description
      t.timestamps
    end
  end
end
