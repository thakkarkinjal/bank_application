Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :transactions, only: [:show, :index] do
    collection do
      get :deposit
      get :withdraw
      get :transfer
      put :deposit_update
      put :withdraw_update
      put :transfer_update
    end
  end
end
