class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :team_id
      t.integer :player_id

      t.timestamps
    end
  end
end
