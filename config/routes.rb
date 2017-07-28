Rails.application.routes.draw do

  resources :users, only: [:new, :create, :destroy, :show, :update]
  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    resources :albums, only: [:new] do
    end
  end

  resources :albums, except: [:index] do
      member do
        get 'delete'
      end
  end

  resources :tracks, except: [:index] do
    resources :notes, only: [:create]
  end
  resources :notes, except: [:index] do
  end

end
