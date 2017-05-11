Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root :to => "items#index"

resource :cart

resources :items do
  collection do
    post :bulk_compare
    get :compare
  end
end

resources :orders

namespace :admin do
  resources :items
end




end
