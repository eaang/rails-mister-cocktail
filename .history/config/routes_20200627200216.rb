Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, only: %i[index show create update destroy] do
    resources :doses, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :doses, only: [:destroy]
  root to: 'cocktails#home'

  get '/search', to: 'cocktails#search'
end
