CapitalUnderground::Application.routes.draw do
 # patch 'users/:id' => 'users#shroom_form'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  root "static_pages#home"
 #match 'users/:id/troy',		to: 'users#troy',					 via: 'get'
 #match 'users/:id/albany', to: 'users#albany', 			 via: 'get'
 	match 'user/albany/:id', to: 'users#albany', :as => :albany_users, via: 'get'
  	match 'user/troy/:id', to: 'users#troy', :as => :troy_users, via: 'get'
  match '/signup',  to: 'users#new',					 via: 'get'			
  match '/signin',  to: 'sessions#new', 			 via: 'get'
  match '/signout', to: 'sessions#destroy',		 via: 'delete'
  match '/schen',   to: 'static_pages#schen',	 via: 'get'
  match '/help',    to: 'static_pages#help',   via: 'get'
  match '/score',   to: 'static_pages#score',  via: 'get'
 	
 	
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
