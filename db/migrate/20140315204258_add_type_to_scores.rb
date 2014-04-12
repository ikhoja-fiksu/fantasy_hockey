class AddTypeToScores < ActiveRecord::Migration
  def change
  	add_column :scores, :score_type, :string
  end
end
