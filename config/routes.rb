Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users, only: [:index, :show]
  resources :users do
    resources :cvs
  end
  resources :agents
  resources :jobs

  match '/about', to: 'static_pages#about', via: :get
  match '/faq', to: 'static_pages#faq', via: :get

  root to: "jobs#index"

  post 'user_jobs/add'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
