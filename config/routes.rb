Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :recipes, only: [:index, :show, :create, :update, :destroy]
      resources :day_plan_recipes, only: [:create, :destroy], controller: 'day_plan_recipes'
      resources :users, only: [:index, :show, :create, :update, :destroy] do
        resources :day_plans, only: [:index, :show, :create, :update, :destroy], controller: 'user_day_plans'
      end
    end
  end
end
