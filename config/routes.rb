Pulsar::Application.routes.draw do
  resources :learnings do
    resources :likes, only:[:create, :destroy]
    resources :comments
  end

  get '/auth/:provider/callback', to: 'users#create'

  get '/users', to: 'users#user_log_out'

  root 'pages#index'

end
