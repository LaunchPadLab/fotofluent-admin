Rails.application.routes.draw do
  devise_for :users
  root 'words#index'
  resources :translations
  resources :languages
  resources :words

  namespace :api do
    namespace :v1 do
      resources :translations, only: [:index]
    end
  end
end
