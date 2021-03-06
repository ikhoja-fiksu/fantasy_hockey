class ContractsController < TeamsController
	
	before_filter :get_team
	before_filter :authenticate_user!

	def create
		@team.contracts.create({player_id: get_player_id})
		redirect_to team_path(@team)
	end

	def new
	end

	def destroy
		Contract.find(params[:id]).destroy
		redirect_to team_path(@team)
	end

	private

		def get_team
			@team = Team.find(params[:team_id])
		end

		def get_player_id
			params[:contract][:player_id]
		end
end