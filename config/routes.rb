Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :products, only: [:index, :show, :edit, :update] do
    resources :products_stocks, except: [:show, :index]
  end

  resources :orders

  root to: 'pages#home'

  get "about_us", to: "pages#about_us"
  get "contacts", to: "pages#contacts"

  get 'event_select', to: 'orders#event_select'
  get 'section_select', to: 'orders#section_select'
  get 'products_select', to: 'orders#products_select'
  get 'confirmation', to: 'orders#confirmation'
end
