Grooves::Application.routes.draw do

  root :to => 'tracks#home'
  get '/track' => 'tracks#track'
  get '/test' => 'tracks#test'
  get '/get_tracks' => 'tracks#get_tracks'

end
