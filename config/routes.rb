Rails.application.routes.draw do
  get 'posts/index'
  get '/' => 'home#top'
  get '/signup' => 'home#signup'
  post '/signup' => 'home#signupCreate'
  get '/signin' => 'home#signin'
  
  get 'posts/create' => 'posts#create'
  post 'posts/save' => 'posts#save'
  post 'posts/:id/save' => 'posts#edit_save'
  get 'posts/index' => 'posts#index'
  post 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/destroy' => 'posts#destroy'
end
