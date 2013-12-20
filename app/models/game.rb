class Game < ActiveRecord::Base
	has_many :scores

	# create the scores for a game you've created
	def commence_game( player_ids )
		player_ids.each do |player_id|
			player = Player.where( id: player_id ).first
			if player
				# if the player exists, make him/her play in the game and specify the game id as a param
				player.play(id)
			else
				raise "I hate you. Be better at life. Whoa chill bro. Love all around."
			end
		end
	end
	# def play(player)
	# 	for player = Player.id
	# 	Score.create( { value: rand(8), player_id: Player.id, game_id: self.id })
	# end
	# end
	

	# def play
	# 	Player.all.each do |x|
	# 		Score.create( { value: rand(8), player_id: x.id, game_id: self.id })
	# 	end
	# end
end
