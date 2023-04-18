class Api::V1::RecipeController < ApplicationController
  # before_action :day_plan_recipe

  def index
    render json: RecipeSerializer.new(@day_plan_recipe.recipe)
  end

  def create 
    begin 
      render json: RecipeSerializer.new(@day_plan_recipe.recipe.create!(recipe_params))
    end
  end

  def update
    begin
      render json: RecipeSerializer.new(DayPlan.update!(params[:id], recipe_params))
    end
  end

  def destroy
    begin
      render json: RecipeSerializer.new(DayPlan.destroy(params[:id]))
    end
  end

  private

  # def day_plan_recipe
  #   @day_plan_recipe ||= DayPlanRecipe.find(params[:day_plan_recipe_id])
  # end

  def recipe_params
    params.permit(:spoonacular_id, :name, :ingredients, :instructions, :image)
  end
end