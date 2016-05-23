Rails.application.routes.draw do
  
  get '/' => 'pages#index', as: 'pages'

  get '/sponsorships/new' => 'sponsorships#new'
  post '/sponsorships' => 'sponsorships#create'

  get '/players/new' => 'players#new'
  post '/players' => 'players#create'

  get '/diners/new' => 'diners#new'
  post '/diners' => 'diners#create'

  get '/signups/index' => 'signups#index'

  get '/users/show' => 'users#show'

end
