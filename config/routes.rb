Rails.application.routes.draw do
  get 'languages/switch_locale'


  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    # Your existing routes go here
  get 'collections/new'
  get 'collections/create'
  get 'collections/edit'
  get 'collections/update'
  delete 'collections/destroy'

  get 'items/new'
  get 'items/create'
  post 'items/create'

  
  get 'items/edit'
  get 'items/update'
  get 'items/destroy'
  # get 'home/index'
  # 
  post '/toggle_dark_mode', to: 'application#toggle_dark_mode'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#index'
  post 'create_collection', to: 'home#create_collection'
  get 'view_collection', to: 'home#view_collection'

  resources :collections, only: [:show] # Add this line
 

  end
  resources :collections do
    resources :items, only: [:new, :create]
  end

end
 