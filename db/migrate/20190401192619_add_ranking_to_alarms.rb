class AddRankingToAlarms < ActiveRecord::Migration[5.2]
  def change
    add_column :alarms, :ranking, :integer
  end
end
