class CitiesController < ApplicationController

  def home
		t = Track.new 
		@filtered_tracks = t.get_tracks
	end
  
  def track
		# dumb_tracks = []
		# @old_tracks = []

		# client = Soundcloud.new(:client_id => "e9e8fbf8ac2f57eb0f54519af9c2f22e")

		# dumb_tracks = client.get('/tracks', :created_at => {:from => (2009-07-19).to_s, 
		# 	:limit => 5})
		
		# dumb_tracks.each do |track|
		# 	user = client.get('/users/' + track.user_id.to_s)

		# 	if user.city.present? && user.country.present?
		# 		geocoding = Geocoder.search("#{user.city}, #{user.country}").first
		# 		# track.delete_if {geocoding.nil?}
		# 		if geocoding
		# 			lat = geocoding.data["geometry"]["location"]["lat"]
		# 			lng = geocoding.data["geometry"]["location"]["lng"] 
		# 		end

		# 		@old_tracks << { track: track, user: user, coordinates: [lat, lng] }
		# 	end
		# end
  end

  def test
		  	
  	#instantiating a tracks object and calling the API get/filter method on it.
  	t = Track.new 
  	@filtered_tracks = t.get_tracks
  	
  	#putting filtered tracks into my ActiveRecord Table, track_data  	
  	@filtered_tracks.each do |filtered_track|
  		if filtered_track[:coordinates].first.nil?
  			@filtered_tracks.delete(filtered_track)
  		else 
  			TrackData.create(:track_id => filtered_track[:track].id, 
	  		:track_name => filtered_track[:track].title, :track_permalink => filtered_track[:track].permalink,
	   		:user_id => filtered_track[:user].id, :username => filtered_track[:user].username, 
	   		:user_city => filtered_track[:user].city, :user_country => filtered_track[:user].country, 
	   		:user_permalink => filtered_track[:user].permalink, :user_avatar_url => filtered_track[:user].avatar_url,
	   		:lat => filtered_track[:coordinates].first, :lng => filtered_track[:coordinates].last)
  		end
  	end
  	
  	@track_data = TrackData.all
  
  end

end
