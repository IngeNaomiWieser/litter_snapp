Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  get '/', to: 'welcome#index', as: 'home'
  get '/about', to: 'welcome#about'
  get '/map', to: 'welcome#map'

  resources :sessions, only: [:new, :create] do
    get :destroy, on: :collection
  end

  resources :litters, only: [:new, :create, :show]

end
