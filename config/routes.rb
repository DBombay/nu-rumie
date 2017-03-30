Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :rumie_groups
end
