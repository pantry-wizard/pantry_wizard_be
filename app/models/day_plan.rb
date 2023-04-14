class DayPlan < ApplicationRecord
  validates_presence_of :date, uniqueness: { scope: :user_id }

  belongs_to :user
  has_many :day_plan_recipes
  has_many :recipes, through: :day_plan_recipes
end
