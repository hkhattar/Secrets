Rails.application.routes.draw do
  get 'likes/create'

  get 'likes/delete'

  post 'likes' => 'likes#create'

  post 'secrets' => 'secrets#create'

  get 'secrets' => 'secrets#index'

  delete 'secrets/:id' => 'secrets#delete'



  get 'users/show'

  post 'users' => 'users#create'

  get 'users/new' => 'users#new'

  get 'users/:id/edit' => 'users#edit'

  patch 'users/:id' => 'users#update'

  delete 'users/:id' => 'users#delete'

  

  get 'sessions/new' => 'sessions#new'

  post 'sessions' =>'sessions#create'

  get 'users/:id' => 'users#show'

  delete 'sessions' =>'sessions#destroy'

  delete 'likes' => 'likes#delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
