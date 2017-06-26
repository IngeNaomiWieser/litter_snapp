Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  get '/', to: 'welcome#index', as: 'home'


end
