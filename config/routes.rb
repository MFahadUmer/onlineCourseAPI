Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :create]
  post 'login', to: 'users#login'
  post 'userFavourite/:id', to: 'users#userfavourite'
  post 'deletefavourite', to: 'favourites#deletefavourite'
  post 'authorCourses/:id', to: 'users#authorcourses'
  resources :courses, only: [:index, :create,:destroy]
  resources :favourites, only: [:index, :create, :show, :destroy]
end
