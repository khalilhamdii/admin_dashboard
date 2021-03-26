Rails.application.routes.draw do
  devise_scope :user do
    get "/sign_in" => "devise/sessions#new"
  end
  devise_for :users, :skip => [:registrations] 

  root to: "user_dashboard#index"
  resources :admin_portal
  get '/portal', to: 'admin_portal#index', as: 'portal'
  post "/admin_portal/new" => "admin_portal#create"
  # get "/portal/edit" => "admin_portal#edit", as: "edit_user"
  # put "/portal/edit" => "admin_portal#update"
  get '/dashboard', to: 'user_dashboard#index', as: 'dashboard'
end