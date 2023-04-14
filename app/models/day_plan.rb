class DayPlan < ApplicationRecord
  belongs_to :user

  validates_presence_of :date
  validates_uniqueness_of :date, scope: :user_id


  has_many :day_plan_recipes
  has_many :recipes, through: :day_plan_recipes
end
