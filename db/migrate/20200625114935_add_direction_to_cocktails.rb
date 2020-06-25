class AddDirectionToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :direction, :string
  end
end
