Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations"}

  root to: 'pages#home'
  # get 'dashboard', to: 'pages#dashboard', as: :dashboard

  resources :users do
    resources :businesses, only: %i[new create]
    resources :influencers, only: %i[new create]
  end

  resources :influencers, only: %i[index show]

  resources :businesses, only: %i[edit update index] do
    resources :campaigns, only: %i[new create]
  end

  resources :campaigns, only: %i[index show edit update] do
    resources :proposals, only: %i[index new create]
  end

  resources :proposals, only: %i[show edit update] do
    resources :reviews, only: %i[new create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
