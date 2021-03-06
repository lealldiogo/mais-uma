Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :products, only: [:index, :show, :edit, :update] do
    resources :products_stocks, except: [:show, :index]
  end
  resources :products_stocks, only: [:show, :index]

  resources :orders do
    resources :payments, only: [:new, :create]
  end

  resources :contacts, only: [:new, :create]

  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  root to: "pages#home"

  #get 'home', to: 'pages#home'
  get "about_us", to: "pages#about_us"
  get "partner_side", to: "pages#partner_side"
  get "partner_orders", to:"pages#partner_orders"
  get "partner_kpi", to:"pages#partner_kpi", as: :kpi

  get "kpi_revenue_generated", to:"pages#kpi_revenue_generated"
  get "kpi_demand_overview", to:"pages#kpi_demand_overview"
  get "kpi_delivery_ranking", to:"pages#kpi_delivery_ranking"
  get "kpi_order_details", to:"pages#kpi_order_details"
  get "kpi_customer_profiles", to:"pages#kpi_customer_profiles"
  get "kpi_stand_reports", to:"pages#kpi_stand_reports"

  get 'event_select', to: 'orders#event_select'
  get 'section_select', to: 'orders#section_select'
  get 'products_select', to: 'orders#products_select'
  get 'confirmation', to: 'orders#confirmation'

  get 'order_acceptance', to: 'delivery_guys#order_acceptance'#, as: :order_acceptance
  get 'order_picking_up/:order_id', to: 'delivery_guys#order_picking_up', as: :order_picking_up
  get 'order_delivering/:order_id', to: 'delivery_guys#order_delivering', as: :order_delivering

  post 'order_acceptance_update', to: 'delivery_guys#order_acceptance_update'
  post 'order_picking_up_update', to: 'delivery_guys#order_picking_up_update'
  post 'order_delivered_update', to: 'delivery_guys#order_delivered_update'

  get 'test', to: 'pages#test'
end
