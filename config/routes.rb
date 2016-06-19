Rails.application.routes.draw do
  
  get '/' => 'pages#index', as: 'pages'

  get '/sponsorships' => 'sponsorships#index'
  get '/sponsorships/new' => 'sponsorships#new', as: 'new_sponsorships'

  get '/players' => 'players#index'
  get '/players/new/:count' => 'players#new', as: 'new_players'

  get '/diners' => 'diners#index'
  get '/diners/new' => 'diners#new', as: 'new_diners'

  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
  get '/users/show' => 'users#show'

  resources :signups, except: [:delete]

  get '/session/new' => 'session#new', as: 'new_session'
  post '/session' => 'session#create'
  get '/logout' => 'session#logout'

end
