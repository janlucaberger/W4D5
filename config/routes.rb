Rails.application.routes.draw do

  resources :users, only: [:new, :create, :destroy, :show, :update]
  resource :session, only: [:new, :create, :destroy]

  resources :bands
  resources :albums, except: [:index]
  resources :tracks, except: [:index]
end
