Rails.application.routes.draw do
  resources :events do
  	resource :posts
  end
end
