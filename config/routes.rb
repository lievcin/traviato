Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :sources
  resources :proposals, only: :index
  resources :listing_mappers, only: :create

  get 'search_work', to: 'works#search'

end
