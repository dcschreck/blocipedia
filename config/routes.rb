Rails.application.routes.draw do
  # get 'charges/index'
  # get 'charges/new'
  # get 'charges/create'
  resources :wikis
  resources :charges, only: [:new, :create]

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
