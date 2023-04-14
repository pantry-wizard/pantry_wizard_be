class DayPlan < ApplicationRecord
  validates :date, uniqueness: { scope: :user_id }

  belongs_to :user
  has_many :day_plan_recipes
  has_many :recipes, through: :day_plan_recipes
end
