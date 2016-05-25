Rails.application.routes.draw do
  
  get '/' => 'pages#index', as: 'pages'

  get '/sponsorships/new' => 'sponsorships#new', as: 'new_sponsorships'
  # post '/sponsorships' => 'sponsorships#create'

  get '/players/new' => 'players#new', as: 'new_players'
  # post '/players' => 'players#create'

  get '/diners/new' => 'diners#new', as: 'new_diners'
  # post '/diners' => 'diners#create'

  get '/signups/index' => 'signups#index'
  post '/signups' => 'signups#create'
  get '/signups/:id' => 'signups#show'
  get '/signups/:id/edit' => 'signups#edit', as: 'edit_signup'

  get '/users/show' => 'users#show'

end
