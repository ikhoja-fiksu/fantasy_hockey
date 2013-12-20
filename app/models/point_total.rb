class PointTotal < ActiveRecord::Base
	belongs_to :team
	validates_presence_of :team_id, :score
	validates :score, numericality: { greater_than_or_equal_to: 0 }

	def total
		# start a sum at 0
		sum = 0
		# for every player sum the values of scores in each game
		Player.all.each do |x|
			sum = sum + Score.value
		end
		# return the sum
		sum.inspect
	end
end
