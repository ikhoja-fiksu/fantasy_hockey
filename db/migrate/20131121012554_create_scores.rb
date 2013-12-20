class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :player_id
      t.integer :game_id
      t.integer :point_value

      t.timestamps
    end
  end
end
