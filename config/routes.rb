Rails.application.routes.draw do
  # get 'deals/index'
  # get 'deals/new'
  # get 'deals/create'
  # get 'deals/destroy'
  # get 'categories/index'
  # get 'categories/new'
  # get 'categories/create'
  # get 'categories/show'
  # get 'categories/edit'
  # get 'categories/update'
  # get 'categories/default_category'
  # get 'categories/destroy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'home#index'
  post '/categories/:name/:icon', to: 'categories#default_category', as: :default_category
  resources :users, only: [:show] do
    resources :categories do
      resources :deals 
    end
  end
end
