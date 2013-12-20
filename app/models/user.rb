class User < ActiveRecord::Base
	has_one :team
	validates_presence_of :name

	def self.create_teams
		# go through all users and do something to each user
		User.all.each do |user|
			# for this specific user, check if they have a team and if not create em
			if user.team.nil?
				Team.create( { name: ((0...8).map { (65 + rand(26)).chr }.join), user_id: user.id } )
			end
		end
	end
end
