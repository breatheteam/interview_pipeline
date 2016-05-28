Rails.application.routes.draw do
  devise_for :users

  resources :companies do
    resources :answers
  end

  resources :questions

  root 'static_pages#index'
end
