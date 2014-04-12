class AddExternalIDtoPlayer < ActiveRecord::Migration
  def change
  	remove_column :players, :height
  	remove_column :players, :weight
  	add_column :players, :external_player_id, :integer
  end
end
