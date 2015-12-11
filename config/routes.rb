Rails.application.routes.draw do
  root to: 'welcome#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'auth/failure', to: redirect('/')
end
