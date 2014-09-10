Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  devise_for :users

  resources :users
  resources :events do
  	resource :posts
    resource :pledges
    resource :trainingsessions
    # resource :challenges

    collection do
      get 'select'
    end

    resources :posts do
      resource :comments
    end

    resources :challenges do
      get :create_challenge_post, on: :collection
    end

  end

  resources :trainingsessions

  get 'users/:user_id/events', to: 'users#events', as: :user_events
  get 'users/:user_id/profile', to: 'users#profile', as: :profile
  post 'trainingsessions/:event_id/mmf', to: 'trainingsessions#mmf', as: :mmf_training
  post '/challenge/:id/accept', to: 'challenges#accept'
  post '/challenge/:id/decline', to: 'challenges#decline'
  get 'events/:id/donations', to: 'events#donations', as: :donations
  get '/auth/:provider/callback', to: 'identities#create'
  root 'welcome#index'

end
