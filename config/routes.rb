Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :projects
    end
  end

  post 'authenticate', to: 'authentication#authenticate'
  resources :api_tests
end
