Rails.application.routes.draw do
  devise_for :users
  root to: 'portfolios#index'
  resources :albums, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :album_items, only: [:new, :create, :destroy]
  resources :items, only:  [:index, :show, :new, :edit, :update, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
