class AddTotalGoalsAndAssists < ActiveRecord::Migration
  def change
  	add_column :players, :total_goals, :integer
  	add_column :players, :total_assists, :integer
  end
end
