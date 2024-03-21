Rails.application.routes.draw do
  
  get 'posts/index'
  get 'users/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :posts

end
