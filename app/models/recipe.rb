class Recipe < ApplicationRecord
  validates_presence_of :spoonacular_id

  validates_presence_of :name
  validates_presence_of :ingredients
  validates_presence_of :image

  has_many :day_plan_recipes
  has_many :day_plans, through: :day_plan_recipes
end
