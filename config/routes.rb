Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :products, only: [:index, :show, :edit, :update] do
    resources :products_stocks, except: [:show, :index]
  end
  root to: 'pages#home'
end
