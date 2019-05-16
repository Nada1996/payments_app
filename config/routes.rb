Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :payments, only: [:index, :show]
  post 'authenticate', to: 'authentication#authenticate'
end
