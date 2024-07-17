Rails.application.routes.draw do
  root 'home#index'

  resources :books do
    resources :copies, only: [:create, :edit, :update, :destroy]
  end

  resources :copies, only: [:index]

end
