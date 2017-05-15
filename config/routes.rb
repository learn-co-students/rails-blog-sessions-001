RailsBlog::Application.routes.draw do
  resources :users

  resources :tags
  
  resources :posts do 
    resources :comments
  end

  get '/', to: 'posts#index', as: :main_page
  get '/sessions', to: 'sessions#main_page'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#authenticate'
  get '/logout', to: 'sessions#logout'

  get '/signup', to: 'users#new'


end
