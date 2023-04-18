class Api::V1::DayPlanRecipesController < ApplicationController
  before_action :user_day_plan

  def index
    render json: DayPlanRecipeSerializer.new(@user_day_plan.day_plan_recipes)
  end

  def show
    begin 
      render json: DayPlanRecipeSerializer.new(DayPlanRecipe.find(params[:id]))
    end
  end

  def create 
    begin 
      render json: DayPlanRecipeSerializer.new(@user_day_plan.day_plan_recipes.create!(day_plan_recipe_params))
    end
  end

  def update
    begin
      render json: DayPlanRecipeSerializer.new(DayPlanRecipe.update!(params[:id], day_plan_recipe_params))
    end
  end

  def destroy
    begin
      render json: DayPlanRecipeSerializer.new(DayPlanRecipe.destroy(params[:id]))
    end
  end

  private

  def user_day_plan
    @user_day_plan ||= DayPlan.find(params[:user_id])
  end

  def day_plan_recipe_params
    params.permit(:day_plan_id, :recipe_id, :meal_type)
  end
end