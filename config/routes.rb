Rails.application.routes.draw do
  devise_scope :user do
    get "/sign_in" => "devise/sessions#new"
  end
  devise_for :users, :skip => [:registrations] 

  root to: "user_dashboard#index"
  get '/portal', to: 'admin_portal#index', as: 'portal'
  get "/portal/new" => "admin_portal#new", as: "new_user_registration"
  post "/portal/new" => "admin_portal#create", as: "user_registration"
  get '/dashboard', to: 'user_dashboard#index', as: 'dashboard'
end
