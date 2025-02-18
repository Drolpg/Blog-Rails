Rails.application.routes.draw do
  # get '/', controller: 'home', action: 'index'
  root 'home#index'

  # resources :members, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :members, only: %i[ index new create show edit update destroy ]
end
