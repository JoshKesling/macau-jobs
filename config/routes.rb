Rails.application.routes.draw do
  resources :cvs
  devise_for :users
  resources :agents
  resources :jobs

  root "jobs#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
