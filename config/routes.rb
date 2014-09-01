Rails.application.routes.draw do
  devise_for :users
  resources :events do
  	resource :posts
    resource :pledges

    resources :posts do
      resource :comments
    end
  end
<<<<<<< HEAD

  # resources :posts do
  #   resource :comments
  # end
 root 'welcome#index'
=======
 root 'events#index'
>>>>>>> 91716b45a4bb8d13e3008fa7ddb7f776880b5d53
end
