Rails.application.routes.draw do
  get 'photos/create'
  get 'avatars/create'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'

  resources :items, only: [:index, :show, :new, :edit], path: 'articles' do
    resources :photos, only: [:create]
  end

  resources :users, only: [:show, :new, :create, :edit, :update], path: 'utilisateurs' do
    resources :carts, only: [:show], path: 'paniers'
    resources :orders, only: [:new, :show, :create], path: 'commandes'
    resources :avatars, only: [:create]
  end

  # resources :cart_items, only: [:new, :create, :destroy], path: 'contenu-panier'

  # resources :carts
  # resources :cart_items
  resources :cart_items, only: [:create, :destroy]
end
