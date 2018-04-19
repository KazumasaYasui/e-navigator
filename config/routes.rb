Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resources :users, only:[:index, :show, :edit, :update] do
    resources :interviews
    post 'interviews/apply'
  end
  root to: 'users#index'
end
