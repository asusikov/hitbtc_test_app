Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :currencies, only: :index
  resources :pairs, only: [:index, :show]
end
