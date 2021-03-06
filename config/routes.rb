Rails.application.routes.draw do
   devise_for :users

  root 'homes#top'
  get 'home/about' => 'homes#about'

  resources :users, only: [:show, :index, :edit, :update, :destroy] do
      get :followings, on: :member
      get :followers, on: :member
     end
  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' 
 end