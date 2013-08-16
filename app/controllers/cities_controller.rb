class CitiesController < ApplicationController

  def home
		t = Track.new 
		@filtered_tracks = t.get_tracks
	end

  def test
  	@last_tracks = TrackData.last(10)
  	@last_track = TrackData.last
  end

  #test controllers are below
  def get_tracks
  	last_tracks = TrackData.last(10)
  	render :json => last_tracks
  end

  def track
	end

end
