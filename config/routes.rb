SampleApp::Application.routes.draw do

  #get "users/new" listing 11.18
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  #Listing 10.22
  resources :microposts, only: [:create, :destroy]
  #Listing 11.24
  resources :relationships, only: [:create, :destroy]
  
  root  to: 'static_pages#home'

  # For every resource there is a match - via are HTTP request method
  match '/signup',  to: 'users#new',            via: 'get'
  # Sign-in and out
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  # Help
  match '/help',    to: 'static_pages#help',    via: 'get'
  # About
  match '/about',   to: 'static_pages#about',   via: 'get'
  # Contact
  match '/contact', to: 'static_pages#contact', via: 'get'
  
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
