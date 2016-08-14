Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/workouts', to: 'workouts#index'
  get '/workouts/new', to: 'workouts#new'
  post '/workouts', to: 'workouts#create'


end
