class Score < ActiveRecord::Base
	belongs_to :player

	VALID_SCORE_TYPES = ["goals", "assists"]

	validates_presence_of :player_id
	validates_inclusion_of :score_type, in: VALID_SCORE_TYPES
end
