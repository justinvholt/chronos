Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :fixtures do
    resources :fixture_cargos, only: [:create]
    resources :events, only: [:index, :new, :create] do
      collection {post :import}
      end
    end
  resources :clauses
end


