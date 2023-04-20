class Api::V1::RecipesController < ApplicationController

  def index
    render json: RecipeSerializer.new(Recipe.all)
  end

  def create 
    begin 
      render json: RecipeSerializer.new(Recipe.create!(recipe_params))
    end
  end

  def destroy
    begin
      recipe = Recipe.find(params[:id])
      recipe.day_plans.destroy_all
      render json: RecipeSerializer.new(recipe.destroy)
    end
  end

  private

  def recipe_params
    params.permit(:spoonacular_id, :name, :ingredients, :instructions, :image)
  end
end