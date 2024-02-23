Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  
  resources :tweets

  resources :users do
    member do
      post 'follow', to: 'followings#create'
      delete 'unfollow', to: 'followings#destroy'
    end
  end
end

