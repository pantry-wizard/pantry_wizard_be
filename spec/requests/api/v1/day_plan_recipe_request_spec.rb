require "rails_helper"

describe 'DayPlanRecipe API' do
  before :each do
    @user = create(:user)
    @day_plan = create(:day_plan, user: @user, date: "2020-01-01")
    @recipe_1 = Recipe.create(name: 'oatmeal', ingredients: "oats, water, salt", instructions: "boil water, add oats, add salt, stir, eat", spoonacular_id: "1234567890a", image: "https://spoonacular.com/recipeImages/595736-556x370.jpg")
  end
  describe 'happy path' do
    it 'can create a day plan recipe' do
      post "/api/v1/day_plan_recipes", params: { day_plan_id: @day_plan.id, recipe_id: @recipe_1.id }
      expect(response).to be_successful
      day_plan_recipe = JSON.parse(response.body, symbolize_names: true)

      expect(day_plan_recipe[:data][:attributes][:day_plan_id]).to eq(@day_plan.id)
      expect(day_plan_recipe[:data][:attributes][:recipe_id]).to eq(@recipe_1.id)
    end
  end

  describe 'sad path' do
    it 'cannot create a day plan recipe without a day plan id' do
      post "/api/v1/day_plan_recipes", params: { recipe_id: @recipe_1.id }
      expect(response).to_not be_successful
    end
    
    it 'cannot create a day plan recipe without a recipe id' do
      post "/api/v1/day_plan_recipes", params: { day_plan_id: @day_plan.id }
      expect(response).to_not be_successful
    end
  end
end