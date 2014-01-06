Pulsar::Application.routes.draw do
  get "pages/index"
  resources :identities, only: :create
  get '/auth/:provider/callback', to: 'identities#create'
  resources :learnings do
    resources :comments
  end
  root 'pages#index'
end
