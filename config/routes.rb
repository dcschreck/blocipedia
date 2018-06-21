Rails.application.routes.draw do
  resources :wikis
  resources :charges, only: [:new, :create, :edit, :update]
  post 'charges/update'
  get 'charges/update'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
