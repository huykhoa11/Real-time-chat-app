Rails.application.routes.draw do
  post 'messages', to: 'messages#create'

  devise_for :users
  root 'pages#home'
  resources :messages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
