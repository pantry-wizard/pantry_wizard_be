class DayPlanRecipe < ApplicationRecord
  validates_presence_of :day_plan_id
  validates_presence_of :recipe_id
  
  belongs_to :day_plan
  belongs_to :recipe
end
