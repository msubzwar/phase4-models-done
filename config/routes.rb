Rails.application.routes.draw do

    # Semi-static page routes
  get '', to: 'home#index'#, as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy
  get 'home/search', to: 'home#search', as: :search
 



  get 'assignments/index'
  get 'assignments/show'
  get 'assignments/new'
  get 'assignments/create'
  get 'assignments/delete'
  get 'assignments/update'
  # Your routes go here
  resources :stores
  resources :employees



end
