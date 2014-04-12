class Player < ActiveRecord::Base
	has_many :scores
	has_many :teams, through: :contracts
	has_many :contracts
	validates_presence_of :name

	def self.find_or_create_by_external_id(external_player_id, name)
		exists = exists?(external_player_id: external_player_id)
		puts exists
		puts external_player_id
		if !exists
			#create player
			create(name: name, external_player_id: external_player_id)
		else
			puts 'exists'
			puts name
			#return player
			return where(external_player_id: external_player_id).first
		end
	end
end
