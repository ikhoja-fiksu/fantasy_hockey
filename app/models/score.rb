class Score < ActiveRecord::Base
	belongs_to :game
	belongs_to :player
	validates_presence_of :game_id, :player_id
end
