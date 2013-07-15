Grooves::Application.routes.draw do

  root :to => 'cities#home'
  get '/home' => 'cities#home'
  get '/city' => 'cities#city'
  get '/track' => 'cities#track'


  root :to => 'home#start'
  get '/start' => 'home#start' #start method after the hash stands for method "start"
  get '/a' => 'home#a'         # the method is defined in controller page
  get '/b' => 'home#b'
  get '/1' => 'home#one'
  get '/2' => 'home#two'
  get '/door' => 'home#door'   #home stands for home controller. '#' stands for method door.  likened to home.door


end
