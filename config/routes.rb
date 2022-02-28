Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :login, only: [:index, :create]
      delete 'logout', to: 'login#destroy'
      resources :cars, defaults: { format: 'json' }
      resources :reservations, defaults: { format: 'json' }
    end
  end
end
