Rails.application.routes.draw do

  delete '/erase', to: 'weather#erase', constraints: { format: 'json' }
  post '/weather', to: 'weather#create', constraints: { format: 'json' }
  get '/weather', to: 'weather#index', constraints: { format: 'json' }

end
