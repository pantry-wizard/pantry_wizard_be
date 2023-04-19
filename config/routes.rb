Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy] do
        resources :recipes, only: [:index, :show, :create, :update, :destroy]
        resources :day_plans, only: [:index, :show, :create, :update, :destroy], controller: 'user_day_plans'
      end
    end
  end
end
