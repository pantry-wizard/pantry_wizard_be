class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :name, :google_id, :id, :intolerances, :likes, :dislikes, :dietary_restrictions
end
