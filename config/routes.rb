Rails.application.routes.draw do
	root 'home#index'
	resources :monster_drop_records
	resources :records
	resources :monster_drops
	resources :drops
	resources :monsters
end
