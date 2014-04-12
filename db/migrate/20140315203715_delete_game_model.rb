class DeleteGameModel < ActiveRecord::Migration
  def change
  	remove_column :scores, :game_id
  	drop_table :games
  end
end
