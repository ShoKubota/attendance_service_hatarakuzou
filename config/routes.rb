Rails.application.routes.draw do
  namespace :admin do
    resources :attendances, only: %i[index show destroy] do
      collection do
        get 'unapproved'
      end
      member do
        post 'approve'
      end
    end
  end
  root 'user_sessions#new'
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'
  resources :attendances, only: %i[index new edit update destroy] do
    collection do
      post 'clockin'
      post 'clockout'
    end
  end
  namespace :admin do
    get '/login', to: 'user_sessions#new'
    post '/login', to: 'user_sessions#create'
    delete '/logout', to: 'user_sessions#destroy'
    get 'user_sessions/create'
    get 'user_sessions/destroy'
  end
  namespace :admin do
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
