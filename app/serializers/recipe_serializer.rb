class RecipeSerializer
  include JSONAPI::Serializer
  attributes :spoonacular_id, :name, :ingredients, :instructions, :image
end