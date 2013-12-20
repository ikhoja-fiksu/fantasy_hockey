class CreatePointTotals < ActiveRecord::Migration
  def change
    create_table :point_totals do |t|
      t.integer :team_id

      t.timestamps
    end
  end
end
