Rails.application.routes.draw do
  root to: 'welcome#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'auth/failure', to: redirect('/')

  resources :users, only: [:create]
  resources :sessions, only: [:create, :destroy]
  resources :schedules
  resources :locations
  resources :team_members
end
