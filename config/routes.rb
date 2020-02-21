Rails.application.routes.draw do
  devise_for :users,
  path:       '',
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' },
  path_names: {
    sign_in:      'login',
    sign_out:     'logout',
    password:     'secret',
    confirmation: 'verification',
    unlock:       'unblock',
  }
  root to: 'home#index'

  resources :about, only: :index
  resources :audit, only: :index
  resources :profile, only: :index
end
