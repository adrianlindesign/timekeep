Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  resources :users do
    resources :categories do
      resources :entries
    end
  end

  root 'home#index'

  post '/login' => 'session#create'
  delete '/session' => 'session#destroy'

  get '/users/:id/analysis' => 'users#analysis'

  get '/users/:id/data_hash' => 'users#data_hash'

  get '/settings' => 'users#settings'



#                   Prefix Verb   URI Pattern                                                        Controller#Action
#    user_category_entries GET    /users/:user_id/categories/:category_id/entries(.:format)          entries#index
#                          POST   /users/:user_id/categories/:category_id/entries(.:format)          entries#create
#  new_user_category_entry GET    /users/:user_id/categories/:category_id/entries/new(.:format)      entries#new
# edit_user_category_entry GET    /users/:user_id/categories/:category_id/entries/:id/edit(.:format) entries#edit
#      user_category_entry GET    /users/:user_id/categories/:category_id/entries/:id(.:format)      entries#show
#                          PATCH  /users/:user_id/categories/:category_id/entries/:id(.:format)      entries#update
#                          PUT    /users/:user_id/categories/:category_id/entries/:id(.:format)      entries#update
#                          DELETE /users/:user_id/categories/:category_id/entries/:id(.:format)      entries#destroy
#          user_categories GET    /users/:user_id/categories(.:format)                               categories#index
#                          POST   /users/:user_id/categories(.:format)                               categories#create
#        new_user_category GET    /users/:user_id/categories/new(.:format)                           categories#new
#       edit_user_category GET    /users/:user_id/categories/:id/edit(.:format)                      categories#edit
#            user_category GET    /users/:user_id/categories/:id(.:format)                           categories#show
#                          PATCH  /users/:user_id/categories/:id(.:format)                           categories#update
#                          PUT    /users/:user_id/categories/:id(.:format)                           categories#update
#                          DELETE /users/:user_id/categories/:id(.:format)                           categories#destroy
#                    users GET    /users(.:format)                                                   users#index
#                          POST   /users(.:format)                                                   users#create
#                 new_user GET    /users/new(.:format)                                               users#new
#                edit_user GET    /users/:id/edit(.:format)                                          users#edit
#                     user GET    /users/:id(.:format)                                               users#show
#                          PATCH  /users/:id(.:format)                                               users#update
#                          PUT    /users/:id(.:format)                                               users#update
#                          DELETE /users/:id(.:format)                                               users#destroy
#                     root GET    /                                                                  home#index
#                    login POST   /login(.:format)                                                   session#create
#                  session DELETE /session(.:format)                                                 session#destroy                                                session#destroy

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
