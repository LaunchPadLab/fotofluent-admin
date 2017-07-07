Rails.application.routes.draw do
  root 'words#index'
  resources :translations
  resources :languages
  resources :words
end
