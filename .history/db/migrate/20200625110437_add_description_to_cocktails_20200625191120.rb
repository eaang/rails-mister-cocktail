class AddDirectionsToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :directions, :string
  end
end
