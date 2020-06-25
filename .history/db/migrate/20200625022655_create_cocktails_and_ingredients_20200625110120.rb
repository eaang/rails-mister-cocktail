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
      t.belongs_to :cocktails
      t.belongs_to :ingredients
      t.string :description
      t.timestamps
    end
  end
end
