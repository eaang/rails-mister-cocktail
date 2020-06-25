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
 
    create_table :doses, id: false do |t|
      t.belongs_to :assembly
      t.belongs_to :part
    end
  end
end
