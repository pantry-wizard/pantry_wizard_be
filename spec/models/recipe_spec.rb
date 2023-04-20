require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context "validations" do
    it { should validate_presence_of :spoonacular_id }
    it { should validate_presence_of :name }
    it { should validate_presence_of :image }
  end

  context "relationships" do
    it { should have_many :day_plan_recipes }
    it { should have_many(:day_plans).through(:day_plan_recipes) }
  end
end
