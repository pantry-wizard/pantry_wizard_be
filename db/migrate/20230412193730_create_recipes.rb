class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes, id: false, primary_key: :recipe_id do |t|
      t.bigint :recipe_id, primary_key: true
      t.string :name
      t.string :ingredients
      t.string :instructions
      t.string :image
      
      t.timestamps
    end
  end
end
