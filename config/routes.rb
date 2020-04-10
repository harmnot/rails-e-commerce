Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'public#index'
  match 'admin', to: 'admin#index', via: :get
  match 'admin/edit_product/:id', to: 'admin#edit', as: 'edit_product', via: :get
  get 'shop', to: 'shop#index'
  resources :products, controller: 'admin', only: %i[show create update]
  match 'product/:id', to: 'admin#destroy', as: 'del_product', via: :delete
  # namespace :admin do
  #   shop :admin
  # end
end
