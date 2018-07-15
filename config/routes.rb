Rails.application.routes.draw do

  resources :wikis do
      resources :collaborators, only: [:create, :destroy]
  end

  resources :charges, only: [:new, :create, :edit, :update]
  resources :users, only: [:edit, :update]

  post 'users/update'
  get 'users/update'

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
