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
  end
end