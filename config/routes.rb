Rails.application.routes.draw do

  resource :session, only: [ :new, :create, :destroy ]
  resource :registration, only: [ :new, :create ]

  root to: 'home#index'

end
