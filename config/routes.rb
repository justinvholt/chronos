Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :fixtures do
    resources :demurrage, only: [:edit, :update] do
      resources :cargo_events, only: [:new, :create]
    end
  end
end
