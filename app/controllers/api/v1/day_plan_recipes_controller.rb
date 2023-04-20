class Api::V1::DayPlanRecipesController < ApplicationController
  # before_action :user_day_plan

  def create 
    begin 
      render json: DayPlanRecipeSerializer.new(DayPlanRecipe.create!(day_plan_recipe_params))
    end
  end

  private

  def day_plan_recipe_params
    params.permit(:day_plan_id, :recipe_id)
  end
  
end