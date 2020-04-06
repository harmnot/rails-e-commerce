Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'public#index'
  get 'admin', to: 'admin#index'
  get 'shop', to: 'shop#index'
  resources :products, controller: 'admin', only: %i[show create edit]
  # namespace :admin do
  #   shop :admin
  # end
end
