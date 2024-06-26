Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :bags, only: [:index, :show, :new, :create] do
    resources :requests, only: [:new, :create]
  end
  resources :requests, only: [:index, :show, :update]

  # i added the route for the overview page
  get "/your_bags", to: "bags#your_bags"
  get "/about", to: "pages#about", as: :about
  get "/contact", to: "pages#contact"
  # Defines the root path route ("/")
  # root "posts#index"
end
