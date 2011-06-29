AnaIan::Application.routes.draw do
  
  devise_for :users

  match 'admin' => 'admin#index'

  resources :rsvps

  root :to => 'home#index'
  
end
