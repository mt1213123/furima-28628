Rails.application.routes.draw do
  devise_for :users
  root to: 'furimas#index'
  resources :item, only: [:index, :new, :create]
end
