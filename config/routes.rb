Rails.application.routes.draw do
  root 'search#index'
  resources :movies, only: %i[index new create edit update destroy]
end
