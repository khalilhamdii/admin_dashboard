Rails.application.routes.draw do
  devise_for :users
  root to: "admin_portal#index"
end
