Rails.application.routes.draw do

  resources :tickets

  resource :pickups

  resources :labels

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
