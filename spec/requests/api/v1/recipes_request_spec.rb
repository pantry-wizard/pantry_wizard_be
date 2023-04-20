require 'rails_helper'

describe "Recipes API" do
  before :each do
    @user = create(:user)
    @day_plan = @user.day_plans.create(date: "2021-01-02")
    @recipe_1 = @day_plan.recipes.create(name: 'oatmeal', ingredients: "oats, water, salt", instructions: "boil water, add oats, add salt, stir, eat", spoonacular_id: "1234567890a", image: "https://spoonacular.com/recipeImages/595736-556x370.jpg")
    @recipe_2 = @day_plan.recipes.create(name: 'cooked noodles', ingredients: "noodles, water", instructions: "boil water, add noodles, cook until al dente", spoonacular_id: "1234567890b", image: "https://spoonacular.com/recipeImages/595736-556x370.jpg")
  end

  describe "#index" do
    it "returns all recipes" do
      get "/api/v1/recipes"

      expect(response).to be_successful
      recipes = JSON.parse(response.body, symbolize_names: true)

      expect(recipes[:data].count).to eq(2)
      expect(recipes[:data][0][:attributes][:name]).to eq(@recipe_1.name)
      expect(recipes[:data][0][:attributes][:ingredients]).to eq(@recipe_1.ingredients)
      expect(recipes[:data][0][:attributes][:instructions]).to eq(@recipe_1.instructions)
      expect(recipes[:data][0][:attributes][:spoonacular_id]).to eq(@recipe_1.spoonacular_id)
      expect(recipes[:data][0][:attributes][:image]).to eq(@recipe_1.image)
      expect(recipes[:data][1][:attributes][:name]).to eq(@recipe_2.name)
      expect(recipes[:data][1][:attributes][:ingredients]).to eq(@recipe_2.ingredients)
      expect(recipes[:data][1][:attributes][:instructions]).to eq(@recipe_2.instructions)
      expect(recipes[:data][1][:attributes][:spoonacular_id]).to eq(@recipe_2.spoonacular_id)
      expect(recipes[:data][1][:attributes][:image]).to eq(@recipe_2.image)
    end
  end

  describe "#create" do
    it "creates a recipe" do
      recipe_params = { name: 'brownies', ingredients: "sugar, chocolate, flour", instructions: "just throw it all in a bowl and mix, spread it out over a baking pan, bake unitl it no longer looks weird", spoonacular_id: "1234567890", image: "https://spoonacular.com/recipeImages/595736-556x370.jpg", day_plan_id: @day_plan.id }

      post "/api/v1/recipes", params: recipe_params
      
      expect(response).to be_successful
      recipe = JSON.parse(response.body, symbolize_names: true)

      expect(recipe[:data][:attributes][:name]).to eq(recipe_params[:name])
      expect(recipe[:data][:attributes][:ingredients]).to eq(recipe_params[:ingredients])
      expect(recipe[:data][:attributes][:instructions]).to eq(recipe_params[:instructions])
      expect(recipe[:data][:attributes][:spoonacular_id]).to eq(recipe_params[:spoonacular_id].to_i)
      expect(recipe[:data][:attributes][:image]).to eq(recipe_params[:image])
    end
  end

  describe "#destroy" do
    it "deletes a recipe" do
      expect(@day_plan.recipes.count).to eq(2)
      delete "/api/v1/recipes/#{@recipe_1.id}"
      expect(response).to be_successful
      expect(@day_plan.recipes.count).to eq(1)
    end
  end
end