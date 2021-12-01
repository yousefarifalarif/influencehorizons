Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  resources :users, only: [:show] do
    resources :businesses, only: %i[new create edit update]
    resources :influencers, only: %i[new create edit update]
  end

  resources :influencers, only: %i[index show edit update]

  resources :businesses, only: %i[edit update index] do
    resources :campaigns, only: %i[new create]
  end

  resources :campaigns, only: %i[index show edit update] do
    resources :proposals, only: %i[new create]
  end

  resources :proposals, only: %i[index show edit update] do
    post "choose_influencers", on: :collection
    resources :reviews, only: %i[new create]
  end

  resources :messages, only: :create
  # resources :chatrooms, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
