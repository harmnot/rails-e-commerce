Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'public#index'
  get 'admin', to: 'admin#index'
  resources :products, controller: 'admin'
  # namespace :admin do
  #   resources :admin
  # end
end
