Rails.application.routes.draw do

  post 'comments'=>'comments#create'
  delete 'comments/:id'=>'comments#destroy', as: 'destroy_comments'

  get 'messages'=>'messages#index'
  post 'messages'=>'messages#create'
  get 'messages/:id'=>'messages#show'
  delete 'messages/:id'=>'messages#destroy', as: 'destroy_messages'

  post 'follows'=>'follows#create', as: 'create_follows'
  delete 'follows/:id'=>'follows#destroy', as: 'destroy_follows'

  get 'users/new'=>'users#new', as: 'new_users'
  post 'users'=>'users#create'
  get 'users/:id'=>'users#show', as: 'show_users'
  get 'users/:id/edit'=>'users#edit'
  patch 'users/:id'=>'users#update'

  get ''=>'voices#index', as: 'index_voices'
  get 'aboutUs'=>'voices#show'

  get 'sessions/new'=>'sessions#new', as: 'new_sessions'
  post 'sessions'=>'sessions#create'
  delete 'logout'=>'sessions#destroy', as: 'destroy_sessions'

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
