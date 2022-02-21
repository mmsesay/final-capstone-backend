Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :login, only: [:index, :create]
      delete 'logout', to: 'login#destroy'
    end
  end
end
