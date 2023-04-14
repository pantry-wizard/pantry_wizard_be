require 'rails_helper'

describe "DayPlan API" do
  before :each do
    @user = create(:user)
    @user2 = create(:user)
    @day_plan = create(:day_plan, user: @user, date: "2020-01-01")
    @day_plan2 = create(:day_plan, user: @user, date: "2020-01-02")
    @day_plan3 = create(:day_plan, user: @user, date: "2020-01-03")
    @day_plan4 = create(:day_plan, user: @user2, date: "2020-01-03")
  end

  describe "#index" do
    it "returns all day plans" do
      get "/api/v1/users/#{@user.id}/day_plans"

      expect(response).to be_successful
      plan = JSON.parse(response.body, symbolize_names: true)

      expect(plan[:data].count).to eq(3)
      expect(plan[:data][0][:attributes][:date]).to eq(@day_plan.date.to_s)
      expect(plan[:data][1][:attributes][:date]).to eq(@day_plan2.date.to_s)
      expect(plan[:data][2][:attributes][:date]).to eq(@day_plan3.date.to_s)
    end
  end

  describe "#show" do
    it "returns a day plan" do
      get "/api/v1/users/#{@user.id}/day_plans/#{@day_plan.id}"

      expect(response).to be_successful
      plan = JSON.parse(response.body, symbolize_names: true)

      expect(plan[:data][:attributes][:date]).to eq(@day_plan.date.to_s)
      expect(plan[:data][:attributes][:user_id]).to eq(@day_plan.user_id)
    end
  end

  describe "#create" do
    it "creates a day plan" do
      plan_params = { date: "2020-01-04" }

      post "/api/v1/users/#{@user.id}/day_plans", params: plan_params
      
      expect(response).to be_successful
      plan = JSON.parse(response.body, symbolize_names: true)
      
      expect(plan[:data][:attributes][:date]).to eq(plan_params[:date])
      expect(@user.day_plans.count).to eq(4)
    end

    it 'returns a 400 if day plan not created due to non-unique date' do
      plan_params = { date: "2020-01-02" }
      post "/api/v1/users/#{@user.id}/day_plans", params: plan_params
      
      expect(response.status).to eq(404)
      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:errors][0][:title]).to eq("Validation failed: Date has already been taken")
    end
  end

  describe "#update" do
    it "updates a day plan" do
      plan_params = { date: "2020-01-05" }

      patch "/api/v1/users/#{@user.id}/day_plans/#{@day_plan.id}", params: plan_params
      
      expect(response).to be_successful
      plan = JSON.parse(response.body, symbolize_names: true)
      expect(plan[:data][:attributes][:date]).to eq(plan_params[:date])
    end

    it 'returns a 400 if day plan not updated due to non-unique date' do
      plan_params = { date: "2020-01-02" }
      patch "/api/v1/users/#{@user.id}/day_plans/#{@day_plan.id}", params: plan_params
      
      expect(response.status).to eq(404)
      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:errors][0][:title]).to eq("Validation failed: Date has already been taken")
    end
  end
end