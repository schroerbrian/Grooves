class CitiesController < ApplicationController

  def home
 
	 	@users = [] #holder variable 
		@good_users = []
		@good_tracks = []
	  @geolocation = [] 


		#here's where i call the soundcloud api
		client = Soundcloud.new(:client_id => "e9e8fbf8ac2f57eb0f54519af9c2f22e")

		tracks = client.get('/tracks', :limit => 5)
		tracks.each do |track|
			user = client.get('/users/' + track.user_id.to_s)

			if user.city.present? && user.country.present?
				geocoding = Geocoder.search("#{user.city}, #{user.country}").first
				# track.delete_if {geocoding.nil?}
				if geocoding
					lat = geocoding.data["geometry"]["location"]["lat"]
					lng = geocoding.data["geometry"]["location"]["lng"] 
				end

				@good_tracks << { track: track, user: user, coordinates: [lat, lng] }
			end
		end
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
