Rails.application.routes.draw do
  devise_for :users
  root 'words#index'
  resources :translations
  resources :languages
  resources :words
end
