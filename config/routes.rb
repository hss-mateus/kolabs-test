Rails.application.routes.draw do
  root 'search#index'
  resources :movies
end
