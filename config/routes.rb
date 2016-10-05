Rails.application.routes.draw do

  root 'main#index'

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :doctors
  resources :patients

  resources :appointment_dates
  resources :appointments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
