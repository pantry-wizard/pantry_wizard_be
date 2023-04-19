class DayPlanSerializer
  include JSONAPI::Serializer
  attributes :user_id, :date, :recipes
end