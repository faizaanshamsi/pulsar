Pulsar::Application.routes.draw do
  resources :learnings do
    resources :comments
  end

  get '/auth/:provider/callback', to: 'users#create'

end
