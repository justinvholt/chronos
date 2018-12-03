Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :fixtures, only: [:index, :new, :create, :update, :edit] do
    resources :calculation, only: [:show, :update, :edit, :update] do
      resources :cargo_events, only: [:new, :create]
    end
  end
end
