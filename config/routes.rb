Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy] do
        resources :day_plans, only: [:index, :show, :create, :update, :destroy], controller: 'user_day_plans' do
          resources :day_plan_recipes, only: [:index, :show, :create, :update, :destroy] do
            resources :recipe, only: [:index, :show, :create, :update, :destroy]
          end
        end
      end
    end
  end
end
