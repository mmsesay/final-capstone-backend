Rails.application.routes.draw do
  resources :cars
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :login, only: [:index, :create]
      delete 'logout', to: 'login#destroy'
      resources :users, only: [:index] do
        resources :cars do
          resources :reservations
        end
      end
    end
  end
end
