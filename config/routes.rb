Rails.application.routes.draw do

  resource :session, only: [ :new, :create, :destroy ]
  resource :registration, only: [ :new, :create ]

  resources :bank_accounts, only: [ :index, :new, :create, :edit, :update ]
  resources :categories, only: [ :index, :new, :create, :edit, :update ]

  root to: 'home#index'

end
