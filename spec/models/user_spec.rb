require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    let(:google_id) { '12aB4567890' }
    
    before do
      # create a user with a valid google_id
      User.create(email: 'test@example.com', google_id: google_id, name: 'test')
    end

    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :google_id }
    it { should validate_uniqueness_of :google_id }
  end

  context "relationships" do
    it { should have_many :day_plans}
    it { should have_many(:day_plan_recipes).through(:day_plans)}
    it { should have_many(:recipes).through(:day_plan_recipes)}
  end
end
