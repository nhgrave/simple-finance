Rails.application.routes.draw do

  get '/home' => 'home#index', as: :home

  root 'home#index'

end
