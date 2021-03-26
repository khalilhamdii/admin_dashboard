Rails.application.routes.draw do
  devise_for :users
  root to: "user_dashboard#index"
  get '/portal', to: 'admin_portal#index', as: 'portal'
  get '/dashboard', to: 'user_dashboard#index', as: 'dashboard'
end
