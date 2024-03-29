Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/", to: "artists#index"

  resources :artists, only: [:index, :show] do
    collection do
      get :search, to: "artists#search"
    end
  end
  resources :albums, only: [:index] do
    collection do
      get :search, to: "albums#search"
    end
  end

  # root "artists#index"
end
