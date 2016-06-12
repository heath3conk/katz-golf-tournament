Rails.application.routes.draw do
  
  get '/' => 'pages#index', as: 'pages'

  get '/sponsorships/new' => 'sponsorships#new', as: 'new_sponsorships'

  get '/players/new' => 'players#new', as: 'new_players'

  get '/diners/new' => 'diners#new', as: 'new_diners'

  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
  get '/users/show' => 'users#show'

  resources :signups, except: [:delete]

  get '/session/new' => 'session#new', as: 'new_session'
  post '/session' => 'session#create'
  delete '/logout' => 'session#destroy'

end
