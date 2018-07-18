Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :sources
  resources :proposals, only: :index do
  	get :autocomplete_composer_name, on: :collection
  end
  resources :listing_mappers, only: :create
  resources :works, only: :create
	resources :glistings

  get 'search_work', to: 'works#search'
  get 'link_from_df', to: 'listing_mappers#create'

end
