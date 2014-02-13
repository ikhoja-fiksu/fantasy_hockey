class PlayersController < ApplicationController
	def index
		@players = Player.all
	end

	def show
		@player = Player.find(params[:id])
	end

	def new
	end

	def update
		@player = Player.find(params[:id])
		@player.update_attributes(filtered_params)
		redirect_to player_path(@player)
	end

	def edit
		@player = Player.find(params[:id])
	end

	def create
		Player.create(filtered_params)
		redirect_to players_path
	end

	private

		def filtered_params
			params.require(:player).permit(:name, :weight, :height)
		end
	# creating a new method represents a new page
end
