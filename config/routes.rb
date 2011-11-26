Store::Application.routes.draw do
  root to: 'products#index'
  match "products/list",  :to => "products#list", :as => "products_list"
  resources :products
  resources :searches

end
