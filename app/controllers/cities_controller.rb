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
  	#our table instance
  	
  	#the tracks we call from the model
  	t = Track.new 
  	@filtered_tracks = t.get_tracks
  	test_track_info = @filtered_tracks[0][:track]
  	test_user_info = @filtered_tracks[0][:user]
  	test_coordinates = @filtered_tracks[0][:coordinates]
  	
  	#putting our @filtered_tracks into the table 

  	@table_test_track = TrackData.create(:track_id => test_track_info.id, 
  		:track_name => test_track_info.title, :track_permalink => test_track_info.permalink,
   		:user_id => test_user_info.id, :username => test_user_info.username, 
   		:user_city => test_user_info.city, :user_country => test_user_info.country, 
   		:user_coordinates => test_coordinates[0][:coordinates], :user_permalink => test_user_info.permalink, 
			:user_avatar_url => test_user_info.avatar_url)

  	@track_data = TrackData.all


  end

end
