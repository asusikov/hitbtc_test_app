Rails.application.routes.draw do
  get 'currencies/index'

  get 'symbols/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :currencies, only: :index do
    # member do
    #   get 'preview'
    # end
  end

end
