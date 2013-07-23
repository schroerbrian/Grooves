class CitiesController < ApplicationController

  def home
 
	 	@users = [] #holder variable 
		@good_users = []
		@good_tracks = []
	  @geolocation = [] 


		#here's where i call the soundcloud api
		client = Soundcloud.new(:client_id => "e9e8fbf8ac2f57eb0f54519af9c2f22e")

		tracks = client.get('/tracks', :limit => 15)
		tracks.each do |track|
			user = client.get('/users/' + track.user_id.to_s)

			if user.city.present? && user.country.present?
				geocoding = Geocoder.search("#{user.city}, #{user.country}").first
				# track.delete_if {geocoding.nil?}
				if geocoding
					lat = geocoding.data["geometry"]["location"]["lat"] ? geocoding.data["geometry"]["location"]["lat"] : ['51']
					lng = geocoding.data["geometry"]["location"]["lng"] ? geocoding.data["geometry"]["location"]["lng"] : ['0.1']
				end

				@good_tracks << { track: track, user: user, coordinates: [lat, lng] }
			end
		end
	end
  
  def track
		dumb_tracks = []
		@old_tracks = []

		client = Soundcloud.new(:client_id => "e9e8fbf8ac2f57eb0f54519af9c2f22e")

		dumb_tracks = client.get('/tracks', :created_at => {:from => (2009-07-19).to_s, 
			:limit => 5})
		
		dumb_tracks.each do |track|
			user = client.get('/users/' + track.user_id.to_s)

			if user.city.present? && user.country.present?
				geocoding = Geocoder.search("#{user.city}, #{user.country}").first
				# track.delete_if {geocoding.nil?}
				if geocoding
					lat = geocoding.data["geometry"]["location"]["lat"]
					lng = geocoding.data["geometry"]["location"]["lng"] 
				end

				@old_tracks << { track: track, user: user, coordinates: [lat, lng] }
			end
		end
  end

end
