class Team < ActiveRecord::Base
	belongs_to :user
	has_many :contracts
	has_many :players, through: :contracts
	has_one :point_total
	validates_presence_of :user_id

	# create the contracts for a team we've created
	def sign(player_id, team_id )
		player = Player.find(player_id)
		team = Team.find(team_id)
		if player && team
			Contract.create( { player_id: player.id, team_id: id })
		end
	end

	def draftable_players
		Player.all
	end

	# def create_contracts( player_ids )
	# 	# team_id = Team.where( id: team_id ).first
	# 	player_ids.each do |player_id|
	# 		player = Player.where( id: player_id ).first
	# 		if player 
	# 			# if the player exists, make him/her play in the game and specify the game id as a param
	# 			team.sign(player_id, id)
	# 		else
	# 			raise "I hate you. Be better at life. Whoa chill bro. Love all around."
	# 		end
	# 	end
	# end
end
