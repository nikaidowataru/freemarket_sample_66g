Rails.application.routes.draw do
  root 'post#index'
  resources :items, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
