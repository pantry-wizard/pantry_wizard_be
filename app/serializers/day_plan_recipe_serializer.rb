class DayPlanRecipeSerializer
  include JSONAPI::Serializer
  attributes :day_plan_id, :recipe_id
end