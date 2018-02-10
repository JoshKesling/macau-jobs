Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :cvs
  end
  resources :agents
  resources :jobs

  match '/about', to: 'static_pages#about', via: :get
  match '/faq', to: 'static_pages#faq', via: :get

  root to: "jobs#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
