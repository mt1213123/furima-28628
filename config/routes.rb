Rails.application.routes.draw do
  devise_for :users
  root to: 'furimas#index'
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
end
