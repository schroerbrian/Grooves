class City < ActiveRecord::Base
  attr_accessible :name, :image


 #  user_ids = []
	# @users = []
	# @cities = []

# {
# :track.title =>  a
# :track.created_at => b
# :track.stream_url => e
# :track.playback_count => f	
# :track.permalink_url => g
# :track.user.username => c   #user is a mini subhash w/o all user attributes (namely, "city")
# :track.user.avatar_url => d
# :track.user.permalink_url => e
#   }

# #these two hashes will have to be linked by track.user_id

# {
# :user.city => a
#   }	


#iterate over the track hash and pull the keys that i need http://api.soundcloud.com/tracks/13158665.json?client_id=e9e8fbf8ac2f57eb0f54519af9c2f22e
#iterate over the user hash and pull the single key i need (city) http://api.soundcloud.com/users/3699101.json?client_id=e9e8fbf8ac2f57eb0f54519af9c2f22e
#merge the two hashes.
#except didn't work
#iterate over the array of hashes; destroy all hashes that don't have a city value

#searching through the data to access cities (how many tracks will i have to make a request for? 200+)
	#will i be able to push cities?
#clearer idea of what i want



 	# client = Soundcloud.new(:client_id => "e9e8fbf8ac2f57eb0f54519af9c2f22e")
		# @tracks = client.get('/tracks', :limit => 20)
		# 	@tracks.each do |track|
		# 		user_ids << track.user_id.to_s
		# 	end 
		# 	user_ids.each do |user_id|
		# 		@users << client.get('/users/' + user_id)
		# 	end




end
