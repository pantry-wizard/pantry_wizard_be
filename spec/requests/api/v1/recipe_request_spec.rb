# require "rails_helper"

# describe "Recipe API" do
#   before :each do
#     @user = create(:user)
#     @day_plan = create(:day_plan, user: @user, date: "2024-01-01")
#     @recipe = create(:recipe)
#     @day_plan_recipe = create(:day_plan_recipe, recipe_id: 716429, day_plan_id: @day_plan.id)
#   end

#   describe "#show" do
#     it "returns a recipe" do
#       VCR.use_cassette('recipe_api_get_recipe') do
#         get_recipe = RecipeService.get_recipe(716429)
#         require 'pry'; binding.pry
        
#         get "api/v1/users/#{@user.id}/day_plans/#{@day_plan.id}/#{get_recipe.id}"

#         expect(response).to be_successful
#         recipe = JSON.parse(response.body, symbolize_names: true)

#         expect(get_recipe[:id]).to eq(716429)
#         expect(get_recipe[:title]).to eq("Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs")
#         expect(get_recipe[:readyInMinutes]).to eq(45)
#       end
#     end
#   end
# end