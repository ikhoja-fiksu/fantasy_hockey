class GetRidOfPointValue < ActiveRecord::Migration
  def change
  	remove_column :scores, :point_value
  end
end
