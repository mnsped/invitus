Invitus::Application.routes.draw do
  resources :events_users

  resources :events

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end