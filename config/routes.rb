Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :fixtures do
    resources :fixture_cargos, only: [:create]
    resources :demurrage, only: [:edit, :update] do
      resources :cargo_events, only: [:new, :create]
    end
  end
  resources :clauses
end
