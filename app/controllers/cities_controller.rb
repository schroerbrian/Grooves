class CitiesController < ApplicationController

  def home
  
  user_ids = []
	@users = []
	@cities = []
	@good_users = []
	@good_tracks = []
	

	client = Soundcloud.new(:client_id => "e9e8fbf8ac2f57eb0f54519af9c2f22e")
		@tracks = client.get('/tracks', :limit => 7)
			@tracks.each do |track|
				@users << client.get('/users/' + track.user_id.to_s)
			end
		
		@users.each do |user|
			if (user.city) and (user.city.length) != 0 and (user.country) and (user.country.length) != 0
				@good_users	<< user
			end
		end
  	
  	@good_users.each do |good_user|
  		@good_tracks << client.get('/users/' + good_user.id.to_s + '/tracks/')[0]
   	end 

  end

  def city
  	client = Soundcloud.new(:client_id => "e9e8fbf8ac2f57eb0f54519af9c2f22e") 
  	@track = client.get("/users/" + params["user"] + "/tracks" )
  	@user = client.get("/users/" + params["user"])
  end

  def track
  end
  
end
