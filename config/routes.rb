Rails.application.routes.draw do
  devise_for :users

  resources :companies do
  end

  resources :questions do
    resources :answers
  end

  root 'static_pages#index'
end
