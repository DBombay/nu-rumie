Rails.application.routes.draw do
  devise_for :users# , controllers: { registrations: 'registrations' }

  resources :users
  resources :rumie_groups
end
