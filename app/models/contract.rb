class Contract < ActiveRecord::Base
	belongs_to :team
	belongs_to :player
	validates_presence_of :team_id, :player_id

	# def sign(player_id, team_id)
	# 	player = Player.find(player_id)
	# 	team = Team.find(team_id)
	# 	if player && team
	# 		Contract.create( { player_id: player.id, team_id: team.id })
	# 	end
	# end
end
