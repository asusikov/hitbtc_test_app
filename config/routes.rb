Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: redirect('/currencies')
  resources :currencies, only: :index
  resources :pairs, only: [:index, :show] do
    member do
      get 'tickers'
    end
  end
end
