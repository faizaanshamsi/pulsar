Pulsar::Application.routes.draw do
  resources :learnings do
    resources :comments
  end
end
