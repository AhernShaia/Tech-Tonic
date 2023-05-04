Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations" }
  
  # path_names: { edit: "/edit" }

  post "users/check_email", to: "users#check_email"
  post "users/check_password", to: "users#check_password"

  get "users/:id", to: "users#show", as: "user"
  get "users/:id/posts", to: "posts#user_posts", as: "user_posts"
  get "users/:id/tags", to: "tags#user_tags", as: "user_tags"
  put "users/:id/follow", to: "users#follow", as: "user_follow"
  
  resources :posts do
    resources :comments
  end
  
  get "tags/:id", to: "tags#show", as: "tag"
  put "tags/:id/follow", to: "tags#follow", as: "tag_follow"

  root to: 'home#index'
end
