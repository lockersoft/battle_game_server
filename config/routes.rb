BattleGameServer::Application.routes.draw do
  get "users/index"
  get "users/available" => 'users#index', :defaults => { :available => '1' }
  get "users/challenge"
  get "users/login" => 'users#login'
  
  api_version(:module => "V1", :path => {:value => "api/v1"}, :default => true) do
  end
  devise_for :users
  
  get "games/new/:challenge" => "games#new", :as => 'new_game'
  get "game/:id" => "games#show", :as => 'game'
  get "games" => "games#index", :as => 'games_path'
  get "game/default/:id(/:placement_num)" => "games#default", :as => 'game_default'
  get "game/:id/clear_board" => "games#clear_board", :as => 'clear_board'
  match "game/:id/add_ship/:ship/:row/:col/:size/:direction" => "games#add_ship", 
        :via => [:get, :post], :as => 'add_ship'
  get "game/:id/:board" => "games#get_board", :as => 'get_board'
  
  # You can have the root of your site routed with "root"
  root 'users#index'

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
