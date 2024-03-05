Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      resources :articles


      get '/member-data', to: 'members#show'
    end
  end

  scope :api, defaults: { format: :json } do
    scope :v1 do
      devise_for :users, controllers: {
                    sessions: 'api/v1/users/sessions',
                    registrations: 'api/v1/users/registrations'
                  }
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
