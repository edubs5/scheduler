Rails.application.routes.draw do
  root 'welcome#index'

  get 'googleaa493e514a2a3b98', to: 'welcome#google_verification'
end
