Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resources :users, only:[:index, :show, :edit, :update]
  root to: 'users#index'
end
