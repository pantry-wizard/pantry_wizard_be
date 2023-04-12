class User < ApplicationRecord
  validates_presence_of :username
  validates_uniqueness_of :email
  validates_presence_of :password
  validates_presence_of :google_id

  has_many :day_plans
  has_many :day_plan_recipes, through: :day_plans
  has_many :recipes, through: :day_plan_recipes
end
