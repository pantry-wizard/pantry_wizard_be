class DayPlan < ApplicationRecord
  validates_uniqueness_of :date

  belongs_to :user
  has_many :day_plan_recipes
  has_many :recipes, through: :day_plan_recipes
end
