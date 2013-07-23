Grooves::Application.routes.draw do

  root :to => 'cities#home'
  get '/home' => 'cities#home'
  get '/city' => 'cities#city'
  get '/track' => 'cities#track'


end
