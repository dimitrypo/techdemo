Rails.application.routes.draw do
  resources :chats

  root 'static_pages#home'

  get 'jualo' => 'static_pages#jualo', as: 'jualo'
  get 'testly' => 'static_pages#testly', as: 'testly'

end
