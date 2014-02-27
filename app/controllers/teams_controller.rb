class TeamsController < ApplicationController

	before_filter :get_user, only: :create

	def index
		@teams = Team.all
	end

	def new
	end

	def create
		Team.create(filtered_params)
		redirect_to teams_path
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
	# creating a new method represents a new page
end
