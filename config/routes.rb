Rails.application.routes.draw do
  resources :chats

  root 'static_pages#home'
end
