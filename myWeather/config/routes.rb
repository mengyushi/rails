Rails.application.routes.draw do
  get 'share/show'
  get 'weather/index'
  resources :temperature
  resources :uploadimgs
  
  resources :shares,only: [:index,:create, :new]
  
  root 'weather#index'
  
  
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
