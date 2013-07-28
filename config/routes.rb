Grooves::Application.routes.draw do

  root :to => 'cities#home'
  get '/track' => 'cities#track'
  get '/test' => 'cities#test'


end
