class Player < ActiveRecord::Base
	has_many :scores
	has_many :teams, through: :contracts
	has_many :contracts
	validates_presence_of :name

	def play(game_id)
		game = Game.find(game_id)
		if game
			Score.create( { value: rand(streak_range), player_id: id, game_id: game.id })
		end
	end

	def streak_range
		if scores.count > 0 && scores.last.value > 3
			8
		else
			5
		end
	end
end
