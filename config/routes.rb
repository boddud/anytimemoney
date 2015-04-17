Anytimemoney::Application.routes.draw do  
  get "signup" => "users#new" , :as => "signup"
  match '/signup', to: 'users#create', via: :post
  match '/users/create' , to: 'users#create' ,via: :post
  get 'pin_check' => "users#create" ,:as => "pin_check"
  get "find_accnum" => "users#edit", :as => "find_accnum" 
  match "withdraw_money" => "users#withdraw_money", :as => "withdraw_money" , via: [:post]
  match "deposite_money" => "users#deposite_money" , :as => "deposite_money" , via: [:post]  
  get "home" => "users#home" , :as => "home"   
  get "withdrw_err" => "users#withdrw_err" ,:as => "withdrw_err"
  get "withdrw_succ" => "users#withdrw_succ" ,:as => "withdrw_succ"
  get "deposite_succ" => "users#deposite_succ" , :as => "deposite_succ"
  get "logout" => "users#destroy" , :as => "logout"
  get "show" => "users#show" , :as => "show"
  resources :users do
    collection do
      
      get 'home'
      get 'withdrw_succ'
      get 'deposite_succ'
      
      get 'withdrw_err'
      post 'deposite_money'
      
      post 'withdraw_money'
    end
  end
  root:to => 'users#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
