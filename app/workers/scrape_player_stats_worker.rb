class ScrapePlayerStatsWorker
	include Sidekiq::Worker
	require 'rest_client'
	require 'json'
	require 'active_support/core_ext/hash/keys'

  # You have to call it perform so that sidekiq knows to execute the task
  	def perform
  		response = RestClient.get 'http://www.kimonolabs.com/api/1xqzocpe?apikey=072a9a1ce4a2446e39e1e1a8259844be'
  		# puts response
  		# data = response.to_hash.with_indifferent_access
  		data = JSON.parse(response)
  		players = data["results"]["collection1"]
  		players.each do |player|
  			goals = player["goals"].to_i
  			assists = player["assists"].to_i
  			name = player["player_name"]["text"]
  			href = player["player_name"]["href"]
	    	# using a regular expression to parse out the external id from the href
	    	external_player_id = player["player_name"]["href"].match(/id=(\d+)/)[1]
	    	# external_player_id = CGI::parse(href.split('?')[1])['id'][0]
	    	current_player = Player.find_or_create_by_external_id(external_player_id, name)

	    	#figure out the goal difference between what the api is reporting and the player's previous value
	    	goal_differential = goals - (current_player.total_goals || 0)
	    	if goals != current_player.total_goals
	    		current_player.update_attributes(total_goals: goals)
	    		current_player.scores.create(value: goal_differential, score_type: "goals")
	    	end
	    	puts "iowejfowjefwo\n\n\n\n"

	    	assist_differential = assists - (current_player.total_assists || 0)
	    	if assists != current_player.total_assists
	    		current_player.update_attributes(total_assists: assists)
	    		current_player.scores.create(value: assist_differential, score_type: "assists")
	    	end
	    end 
    end
end