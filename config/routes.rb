Rails.application.routes.draw do
  
  get '/' => 'pages#index', as: 'pages'

  get '/sponsorships/new' => 'sponsorships#new', as: 'new_sponsorships'
  # post '/sponsorships' => 'sponsorships#create'

  get '/players/new' => 'players#new', as: 'new_players'
  # get '/players/update' => 'players#update', as: 'update_players'
  # post '/players' => 'players#create'

  get '/diners/new' => 'diners#new', as: 'new_diners'
  # post '/diners' => 'diners#create'

  get '/users/show' => 'users#show'

  resources :signups, except: [:delete]

end
