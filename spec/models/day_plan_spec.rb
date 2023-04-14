require 'rails_helper'

RSpec.describe DayPlan, type: :model do
  context "validations" do
    it { should validate_presence_of :date }
    it { should validate_uniqueness_of(:date).scoped_to(:user_id) }
  end

  context "relationships" do
    it { should belong_to :user }
    it { should have_many :day_plan_recipes }
    it { should have_many(:recipes).through(:day_plan_recipes) }
  end
end
