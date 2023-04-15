FactoryBot.define do
  factory :day_plan_recipe do
    day_plan_id { "Add day_plan_id" }
    recipe_id { "Add recipe_id" }
    meal_type { Faker::Number.between(from: 1, to: 4) }
  end
end
