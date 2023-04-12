require 'rails_helper'

RSpec.describe DayPlanRecipe, type: :model do
  context "validations" do
    it { should validate_presence_of :day_plan_id }
    it { should validate_presence_of :recipe_id }
    it { should validate_presence_of :meal_type }
  end

  context "relationships" do
    it { should belong_to :day_plan }
    it { should belong_to :recipe }
  end
end
