class TeamsController < ApplicationController
	def index
		@teams = Team.all
	end

	def show
		@team = Team.find(params[:id])
		@contracts = @team.contracts
	end

	# creating a new method represents a new page
end
