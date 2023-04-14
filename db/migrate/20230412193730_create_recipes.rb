class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.bigint :spoonacular_id
      t.string :name
      t.string :ingredients
      t.string :instructions
      t.string :image
      
      t.timestamps
    end
  end
end
