Rails.application.routes.draw do
  resources :monster_drop_records
  resources :records
  resources :monster_drops
  resources :drops
  resources :monsters
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
