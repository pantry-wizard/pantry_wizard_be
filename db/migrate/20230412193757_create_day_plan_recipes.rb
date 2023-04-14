class CreateDayPlanRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :day_plan_recipes do |t|
      t.references :day_plan, foreign_key: true
      t.references :recipe, foreign_key: { primary_key: :recipe_id}, type: :bigint
      t.integer :meal_type
      
      t.timestamps
    end
  end
end
