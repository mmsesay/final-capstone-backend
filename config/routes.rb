Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get 'login', to: 'login#index'
    end
  end
end
