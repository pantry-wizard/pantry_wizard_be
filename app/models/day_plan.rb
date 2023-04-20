class DayPlan < ApplicationRecord
  belongs_to :user

  validates_presence_of :date
  validates_uniqueness_of :date, scope: :user_id


  has_many :day_plan_recipes
  has_many :recipes, through: :day_plan_recipes

  def self.upcoming
    today = Date.today
    next_week = today + 7.days
    DayPlan.where('date >= ? AND date <= ?', today, next_week).order(date: :asc)
  end
end
