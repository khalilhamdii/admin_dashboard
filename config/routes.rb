Rails.application.routes.draw do
  root to: "user_dashboard#index"
  devise_for :users, :skip => [:registrations] 
  resources :admin_portal
  get '/portal', to: 'admin_portal#index', as: 'portal'
  post "/admin_portal/new" => "admin_portal#create"
  get '/dashboard', to: 'user_dashboard#index', as: 'dashboard'
end