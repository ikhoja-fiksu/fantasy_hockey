class TeamsController < ApplicationController

	before_filter :authenticate_user!

	def index
		@teams = Team.all
	end

	def new
	end

	def create
		user_teams = Team.where(user_id: current_user.id)
		if user_teams.count > 0 
			@team = user_teams.first.id
			redirect_to team_path(@team)
		else
			Team.create(user_id: current_user.id, name: creation_params)
			redirect_to teams_path
		end
	end

	def show
		@team = Team.find(params[:id])
		@contracts = @team.contracts
	end

	def edit
		@team = Team.find(params[:id])
	end

	def update
		@team = Team.find(params[:id])
		@team.update_attributes(filtered_params)
		redirect_to team_path(@team)
	end

	private

	def filtered_params
		params.require(:team).permit(:name)
	end

	# gotta filter_params the params to get at what you want (the name)
	def creation_params
		new_params = params.require(:team).permit(:name)
		new_params.require(:name)
	end
	# creating a new method represents a new page
end
