Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :events do
  	resource :posts
    resource :pledges
    resource :trainingsessions

    collection do
      get 'select'
    end

    resources :posts do
      resource :comments
    end
  end
  
  get 'events/:id/donations', to: 'events#donations', as: :donations
  root 'welcome#index'
end
