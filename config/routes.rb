Rails.application.routes.draw do
  get 'events/show'
  get 'events/new'
  get 'events/index'
  root 'events#index'
  get 'static_pages/secret'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

