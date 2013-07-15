class CitiesController < ApplicationController

  def home
  
  user_ids = []
	@users = []
	@cities = []

	

	client = Soundcloud.new(:client_id => "e9e8fbf8ac2f57eb0f54519af9c2f22e")
		@tracks = client.get('/tracks', :limit => 10)
			@tracks.each do |track|
				user_ids << track.user_id.to_s
			end 
			user_ids.each do |user_id|
				@users << client.get('/users/' + user_id)
			end
			# 	@users.each do |user|
			# 		@cities << user.city
			# 	end
			# @cities.compact!
			# tracks = temp_array.each.user_id.to_s
			# user = client.get('/users/' + userid)
			# city = user.city
			# user.city
  end

  def city
  	client = Soundcloud.new(:client_id => "e9e8fbf8ac2f57eb0f54519af9c2f22e") 
  	@track = client.get("/users/" + params["user"] + "/tracks" )
  end

  def track
  end
  
end
