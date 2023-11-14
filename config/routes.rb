Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
  get 'products/index'
  get 'products/show'
  get 'products/search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
