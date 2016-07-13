Rails.application.routes.draw do
  resources :chat_messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
