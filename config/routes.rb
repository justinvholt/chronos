Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/about' => 'pages#about'

  resources :fixtures do
    collection {post :import}
    resources :cargoes, only: [:create, :update]
    resources :events, only: [:index, :new, :create] do
      collection { post :import, :run_chronos }
      end
    end
  resources :clause_groups
  resources :clauses
end
