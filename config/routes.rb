Rails.application.routes.draw do
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

    resources :challenges
  end

  resources :trainingsessions do 
    post :mmf
  end

  
  
  get 'events/:id/donations', to: 'events#donations', as: :donations
  get '/auth/:provider/callback', to: 'identities#create'
  root 'welcome#index'

end
