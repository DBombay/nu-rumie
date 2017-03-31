Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :rumie_groups

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
end
