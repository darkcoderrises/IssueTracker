Rails.application.routes.draw do
  resources :tags
  resources :invites
  resources :comments
  resources :issues
  root 'users#index'

  get 'signup' => 'users#new'
  resources:users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/project' => 'project#index'
  get '/project/new' => 'project#new'
  post '/project/new' => 'project#create'
  get '/project/:id/edit' => 'project#edit'
  post '/project/:id/edit' => 'project#update'
  get '/project/:id' => 'project#show', as: :id
  get 'project/:id/add' => 'project#add'
  get 'project/:id/remove/:rem' => 'project#remove'

  get '/project/:id/issue/new' => 'issues#new'
  post '/project/:id/issue/new' => 'issues#create', as: :project_id

  get 'issue/:id/comment/new' => 'comments#new'
  post 'issue/:id/comment/new' => 'comments#create', as: :issue_id
  get 'issue/:id/addtag' => 'tags#new'
  post 'issue/:id/addtag' => 'tags#create'
  get 'issue/:id/remtag/:tid' => 'issues#remtag'
  get 'issue/:id/close' => 'issues#close'
  get 'issue/:id/assign/:uid' => 'issues#assign'

  get 'issue/:id/add' => 'issues#voteadd'
  get 'issue/:id/rem' => 'issues#voterem'

  post 'invites/new' => 'invites#create'
  get '/invites/:id' => 'invites#add', as: :invite_id

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
