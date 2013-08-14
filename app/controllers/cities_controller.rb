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
		  	
  	@track_data = TrackData.all
  	@last_tracky = TrackData.last
  	@last_tracks = TrackData.last(10)
  	
  end

  def get_tracks
  	last_tracks = TrackData.last(10)
  	render :json => last_tracks
  end

end
