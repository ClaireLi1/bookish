Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  root 'home#index'

  resources :books, except: [:show] do
    resources :copies, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :copies, only: [:index]

end
