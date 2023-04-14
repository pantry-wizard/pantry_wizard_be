require 'rails_helper'

RSpec.describe DayPlan, type: :model do
  context "validations" do
    it { should validate_presence_of :date }
  end

  context "relationships" do
    it { should belong_to :user }
    it { should have_many :day_plan_recipes }
    it { should have_many(:recipes).through(:day_plan_recipes) }
  end
end
