Rails.application.routes.draw do
  devise_for :users

  get 'dashboard/index', to: 'dashboard#index', as: 'dashboard'

  root 'home#index'

  resources :books, except: [:show] do
    resources :copies, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :copies, only: [:index]

end
