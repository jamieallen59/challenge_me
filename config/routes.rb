Rails.application.routes.draw do
  devise_for :users
  resources :events do
  	resource :posts
  end
 root 'events#index'
end
