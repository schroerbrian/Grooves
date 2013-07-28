# == Schema Information
#
# Table name: track_data
#
#  id               :integer          not null, primary key
#  track_id         :integer
#  track_name       :string(255)
#  track_permalink  :text
#  user_id          :integer
#  username         :string(255)
#  user_city        :string(255)
#  user_country     :string(255)
#  user_coordinates :integer
#  user_permalink   :text
#  user_avatar_url  :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class TrackData < ActiveRecord::Base
  attr_accessible :track_id, :track_name, :track_permalink, :user_id, :username,
  :user_city, :user_country, :user_coordinates, :user_permalink, :user_avatar_url
end
