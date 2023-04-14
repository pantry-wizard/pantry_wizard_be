class DayPlanSerializer
  include JSONAPI::Serializer
  attributes :user_id, :date
end