class DayPlanRecipe < ApplicationRecord
  validates_presence_of :day_plan_id
  validates_presence_of :recipe_id
  validates_presence_of :meal_type
  
  belongs_to :day_plan
  belongs_to :recipe, foreign_key: :recipe_id
end
