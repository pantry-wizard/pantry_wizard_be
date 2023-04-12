class CreateDayPlanRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :day_plan_recipes do |t|
      t.references :day_plan, foreign_key: true
      t.references :recipe, foreign_key: true
      t.integer :meal_type
      
      t.timestamps
    end
  end
end
