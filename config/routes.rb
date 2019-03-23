Rails.application.routes.draw do
  resources :contents
  resources :articles
  resources :authors
  resources :accounts
  resources :histories
  resources :products
  get 'auth/:provider/callback', to: 'users#facebook'
  get 'purchase_item', to: 'products#make_payment'
  post 'process_payment', to: 'products#process_payment'
  resources :users do 
    collection do
      get 'sign_in'
      post 'authentication'
      delete 'logout'
      get 'download_in_csv'
    end
  end
  namespace :api do
    resources :users, only: [:index, :create, :update, :destory]
  end
root to: "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
