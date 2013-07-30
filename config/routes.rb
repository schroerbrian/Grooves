Grooves::Application.routes.draw do

  root :to => 'cities#home'
  get '/track' => 'cities#track'
  get '/test' => 'cities#test'
  get '/get_tracks' => 'cities#get_tracks'


end
