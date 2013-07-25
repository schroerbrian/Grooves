class Track
	attr_accessor :get_tracks
	
	def initialize
		@client = Soundcloud.new(:client_id => "e9e8fbf8ac2f57eb0f54519af9c2f22e")
		@good_tracks = []
	end

	#call api to get tracks
	def get_tracks
		tracks = @client.get('/tracks', :limit => 3)
		tracks.each do |track|
			user = @client.get('/users/' + track.user_id.to_s)
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
		@good_tracks
	end

end