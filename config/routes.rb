Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :products, only: [:index, :show, :edit, :update] do
    resources :products_stocks, except: [:show, :index]
  end

  resources :orders

  root to: 'orders#event_select'

  get "about_us", to: "pages#about_us"
  get "contacts", to: "pages#contacts"
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
end
