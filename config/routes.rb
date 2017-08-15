Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "items#index"

  scope :path => '/api/v1/', :module => "api_v1", :as => 'v1', :defaults => { :format => :json } do
    resources :items
  end

  resource :cart

  resources :items, only: [:index, :show] do
    member do
      post :add_to_cart
    end

    collection do
      post :bulk_compare
      get :compare
    end
  end

  post 'pay2go/return'
  post 'pay2go/notify'

  resources :orders do
    member do
      post :checkout_pay2go
    end
  end

  resources :brands do
     resources :items, :controller => 'brand_items'
  end

  namespace :admin do
    resources :items
  end



end
