class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :height
      t.integer :weight

      t.timestamps
    end
  end
end
