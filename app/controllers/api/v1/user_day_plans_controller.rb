class Api::V1::UserDayPlansController < ApplicationController
  before_action :user

  def index
    if params[:q] == "upcoming"
      render json: DayPlanSerializer.new(@user.day_plans.upcoming)
    else
      render json: DayPlanSerializer.new(@user.day_plans)
    end
  end

  def show
    begin 
      render json: DayPlanSerializer.new(DayPlan.find(params[:id]))
    end
  end

  def create 
    begin 
      render json: DayPlanSerializer.new(@user.day_plans.create!(day_plan_params))
    end
  end

  def update
    begin
      render json: DayPlanSerializer.new(DayPlan.update!(params[:id], day_plan_params))
    end
  end

  def destroy
    begin
      day_plan = DayPlan.find(params[:id])
      day_plan.day_plan_recipes.destroy_all
      render json: DayPlanSerializer.new(DayPlan.destroy(params[:id]))
    end
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end

  def day_plan_params
    params.permit(:date)
  end
end