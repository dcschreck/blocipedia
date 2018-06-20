Rails.application.routes.draw do
  resources :wikis
  # resources :charges, only: [:new, :create]

  devise_for :users

  resources :users, only: [] do
      resources :charges, only: [:new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
