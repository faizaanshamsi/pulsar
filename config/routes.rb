Pulsar::Application.routes.draw do
  resources :learnings do
    resources :likes, only:[:create, :destroy]
    resources :comments
  end

  resources :users, only: [:show, :update]

  get '/auth/:provider/callback', to: 'users#create'

  put 'log_out', to: 'users#log_out'

  root 'pages#index'

end
