class CitiesController < ApplicationController

  def home
 
	 	@users = [] #holder variable 
		@good_users = []
		@good_tracks = []
	  @geolocation = [] 


		#here's where i call the soundcloud api
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
	  
		@first_username = @good_tracks[0].user.username 
		@first_track = @good_tracks[0] 
		@user_location = @good_users[0].city + ", " + @good_users[0].country 
		@name_url = @good_users[0].permalink
		@track_url = @good_tracks[0].permalink	
	
	 #here's where I get the city string's geolocation 
	 @city = Geocoder.search(@user_location) 
	 lat = @city.first.data["geometry"]["location"]["lat"] 
	 lng = @city.first.data["geometry"]["location"]["lng"] 
	 @geolocation << lat  
	 @geolocation << lng 

  end

  

#this is stuff i may not need
  def city
  	client = Soundcloud.new(:client_id => "e9e8fbf8ac2f57eb0f54519af9c2f22e") 
  	@track = client.get("/users/" + params["user"] + "/tracks" )
  	@user = client.get("/users/" + params["user"])
  end

  def track
  	 @coordinates = Geocoder.search("west orange, nj").to_json
  end
  
end
