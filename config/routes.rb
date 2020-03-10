Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :items
  resources :users, only: [:show, :new, :create, :edit, :update], path: 'utilisateurs' do
    resources :carts, only: [:show], path: 'paniers'
    resources :orders, only: [:new, :show, :create], path: 'commandes'
    resources :avatars, only: [:create]
  end
  resources :carts
  resources :cart_items
end
