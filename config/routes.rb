Rails.application.routes.draw do
  resources :articles, only: [:index, :show]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :chats

  root 'static_pages#home'

  get 'jualo' => 'static_pages#jualo', as: 'jualo'
  get 'testly' => 'static_pages#testly', as: 'testly'

end
