require 'rails_helper'

describe "DayPlanRecipes API" do
  before :each do
    @user = create(:user)
    @user2 = create(:user)
    @day_plan = create(:day_plan, user: @user, date: "2020-01-01")
    @recipe_1 = create(:recipe, name: 'oatmeal', ingredients: "oats, water, salt", instructions: "boil water, add oats, add salt, stir, eat", spoonacular_id: "1234567890a", image: "https://spoonacular.com/recipeImages/595736-556x370.jpg")
    @recipe_2 = create(:recipe, name: 'cooked noodles', ingredients: "noodles, water", instructions: "boil water, add noodles, cook until al dente", spoonacular_id: "1234567890b", image: "https://spoonacular.com/recipeImages/595736-556x370.jpg")
    @day_plan_recipe_1 = create(:day_plan_recipe, day_plan_id: @day_plan.id, recipe_id: @recipe_1.id, meal_type: 0)
    @day_plan_recipe_2 = create(:day_plan_recipe, day_plan_id: @day_plan.id, recipe_id: @recipe_2.id, meal_type: 1)
  end

  describe "#index" do
    it "returns all day plan recipes associated with a day plan" do
      get "/api/v1/users/#{@user.id}/day_plans/#{@day_plan.id}/day_plan_recipes"

      expect(response).to be_successful
      day_plan_recipes = JSON.parse(response.body, symbolize_names: true)

      expect(day_plan_recipes[:data].count).to eq(2)
      expect(day_plan_recipes[:data][0][:attributes][:day_plan_id]).to eq(@day_plan.id)
      expect(day_plan_recipes[:data][1][:attributes][:day_plan_id]).to eq(@day_plan.id)
      expect(day_plan_recipes[:data][0][:attributes][:recipe_id]).to eq(@recipe_1.id)
      expect(day_plan_recipes[:data][1][:attributes][:recipe_id]).to eq(@recipe_2.id)
    end
  end

  describe "#show" do
    it "returns a day plan recipe" do
      get "/api/v1/users/#{@user.id}/day_plans/#{@day_plan.id}/day_plan_recipes/#{@day_plan_recipe_1.id}"

      expect(response).to be_successful
      day_plan_recipes = JSON.parse(response.body, symbolize_names: true)

      expect(day_plan_recipes[:data][:attributes][:day_plan_id]).to eq(@day_plan.id)
      expect(day_plan_recipes[:data][:attributes][:recipe_id]).to eq(@recipe_1.id)
    end
  end

  describe "#create" do
    it "creates a day plan recipe" do
      day_plan = create(:day_plan, user: @user, date: "2023-01-21")
      recipe = create(:recipe, name: 'brownies', ingredients: "sugar, chocolate, flour", instructions: "just throw it all in a bowl and mix, spread it out over a baking pan, bake unitl it no longer looks weird", spoonacular_id: "1234567890c", image: "https://spoonacular.com/recipeImages/595736-556x370.jpg")
      day_plan_recipe_params = { day_plan_id: day_plan.id, recipe_id: recipe.id, meal_type: 0 }

      post "/api/v1/users/#{@user.id}/day_plans/#{day_plan.id}/day_plan_recipes/", params: day_plan_recipe_params
      
      expect(response).to be_successful
      day_plan_recipe = JSON.parse(response.body, symbolize_names: true)
      
      expect(day_plan_recipe[:data][:attributes][:day_plan_id]).to eq(day_plan_recipe_params[:day_plan_id])
      expect(day_plan_recipe[:data][:attributes][:recipe_id]).to eq(day_plan_recipe_params[:recipe_id])
    end
  end

  describe "#update" do
    it "updates a day plan recipe" do
      day_plan_recipe_params = { day_plan_id: @day_plan.id, recipe_id: @recipe_1.id, meal_type: 1 }

      patch "/api/v1/users/#{@user.id}/day_plans/#{@day_plan.id}/day_plan_recipes/#{@day_plan_recipe_1.id}", params: day_plan_recipe_params
      
      expect(response).to be_successful
      day_plan_recipe = JSON.parse(response.body, symbolize_names: true)
      expect(day_plan_recipe[:data][:attributes][:meal_type]).to eq(day_plan_recipe_params[:meal_type])
    end
  end

  describe "#destroy" do
    it "deletes a day plan" do
      expect(@day_plan.day_plan_recipes.count).to eq(2)
      delete "/api/v1/users/#{@user.id}/day_plans/#{@day_plan.id}/day_plan_recipes/#{@day_plan_recipe_1.id}"
      expect(response).to be_successful
      expect(@day_plan.day_plan_recipes.count).to eq(1)
    end
  end
end