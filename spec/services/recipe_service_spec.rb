require 'rails_helper'

RSpec.describe RecipeService do
  context 'class methods' do
    context 'search_recipes' do
      it 'returns recipes' do
        VCR.use_cassette('recipe_service_search_recipes') do
          params = {
            query: 'pasta',
            diet: 'vegan' }
          recipe_search = RecipeService.search_recipes(params)
          expect(recipe_search).to be_a(Hash)
        end
      end

      it 'returns up to 5 recipes' do
        VCR.use_cassette('recipe_service_search_recipes') do
          params = {
            query: 'pasta',
            diet: 'vegan' }
          recipe_search = RecipeService.search_recipes(params)
          expect(recipe_search[:results].count).to eq(5)
        end
      end
    end

    context 'get_recipe' do
      it 'returns a recipe' do
        VCR.use_cassette('recipe_service_get_recipe') do
          get_recipe = RecipeService.get_recipe(716429)
          expect(get_recipe).to be_a(Hash)
          expect(get_recipe[:id]).to eq(716429)
          expect(get_recipe[:title]).to eq("Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs")
          expect(get_recipe[:readyInMinutes]).to eq(45)
          expect(get_recipe[:extendedIngredients]).to be_an(Array)
          expect(get_recipe[:instructions]).to be_a(String)
        end
      end
    end
  end
end