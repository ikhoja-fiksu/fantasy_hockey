class AddValueToPointTotals < ActiveRecord::Migration
  def change
    add_column :point_totals, :value, :integer, default: 0
  end
end
