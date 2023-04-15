class RecipePoro
  attr_reader :spoonacular_id,
              :name,
              :summary,
              :ingredients,
              :instructions,
              :image,
              :source_url

  def initialize(recipe_data)
    @spoonacular_id = recipe_data[:id]
    @name = recipe_data[:title]
    @summary = recipe_data[:summary]
    @ingredients = ingredient_info(recipe_data[:extendedIngredients])
    @instructions = recipe_data[:instructions]
    @image = recipe_data[:image]
    @source_url = recipe_data[:sourceUrl]
  end

  def ingredient_info(ingredient_array)
    x = ingredient_array.map do |ingredient|
      { name: ingredient[:name], amount: ingredient[:measures][:us][:amount], unit: ingredient[:measures][:us][:unitShort] }
    end
  end
end