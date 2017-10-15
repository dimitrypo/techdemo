Rails.application.routes.draw do
  resources :chats

  root 'static_pages#home'

  get 'jualo' => 'static_pages#jualo', as: 'jualo'

end
