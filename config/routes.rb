Rails.application.routes.draw do
  get '/students', to: 'students#index', as: 'students'
  get "/students/:id", to: 'students#show'
  get '/courses', to: 'courses#index', as: 'courses'
end
