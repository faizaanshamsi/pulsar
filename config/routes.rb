Pulsar::Application.routes.draw do
  resources :learnings do
    resources :likes, only:[:create, :destroy]
    resources :comments
  end

  get '/auth/:provider/callback', to: 'users#create'

  root 'learnings#index'

end
